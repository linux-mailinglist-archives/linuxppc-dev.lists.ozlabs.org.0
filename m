Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D57F6CB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:17:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5sH4xdmz3vg0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perches.com (client-ip=216.40.44.12; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5rq28DSz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:16:57 +1100 (AEDT)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 6CC5C409CB;
	Fri, 24 Nov 2023 07:16:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 8CAE160009;
	Fri, 24 Nov 2023 07:16:47 +0000 (UTC)
Message-ID: <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
Subject: Re: [PATCH v2 2/7] kexec_file: print out debugging message if
 required
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 23 Nov 2023 23:16:46 -0800
In-Reply-To: <20231124033642.520686-3-bhe@redhat.com>
References: <20231124033642.520686-1-bhe@redhat.com>
	 <20231124033642.520686-3-bhe@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8CAE160009
X-Spam-Status: No, score=-3.42
X-Stat-Signature: r4oqtahenar8h64oxpqpoeo1n6zbhmda
X-Rspamd-Server: rspamout08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19c0OHTlDrKhb/Xt6M9rvhAh1ufC3tVTnk=
X-HE-Tag: 1700810207-170549
X-HE-Meta: U2FsdGVkX1+zlhNkZ9x3SOlShl6+X96epMaKjfHehHKyBsMtcvgR7F6Ii1tgURKZMXTJ4v77gzWxOCKJjrZ32dyx27aEd7KJtn+JaKan9d1JoOg5vx5spjNriOlsrJsAsKTNWoXgbsaaF0Aw9htJa6iNVZZnaP/omO8ddnk/a1hUgTJ/UY7dIv6hTgWYnyt0dTxqhxdXpQIY0i9zYhv989Np0jXyZefmSBvNLtvm6dtRPbiigZYQ2nQLsoXdSGX2/vxVXndB66Niab3Fp1e04lrREsrM7se2cR96ydP7F6f9OXdC0ttkSA5n1SXD5cD7
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: yujie.liu@intel.com, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, nathan@kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-11-24 at 11:36 +0800, Baoquan He wrote:
> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

trivia for pr_debug -> kexec_dprintk conversions for
the entire patch set:

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
[]
> @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  		phdr->p_filesz =3D phdr->p_memsz =3D mend - mstart + 1;
>  		phdr->p_align =3D 0;
>  		ehdr->e_phnum++;
> -		pr_debug("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, paddr=3D=
0x%llx, sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> +#ifdef CONFIG_KEXEC_FILE
> +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, pad=
dr=3D0x%llx, "
> +			"sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
>  			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
>  			ehdr->e_phnum, phdr->p_offset);

It's good form to rewrap continuation lines to the open parenthesis

> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
[]
> @@ -389,11 +391,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, in=
t, initrd_fd,
>  	if (ret)
>  		goto out;
> =20
> +	kexec_dprintk("nr_segments =3D %lu\n", image->nr_segments);
>  	for (i =3D 0; i < image->nr_segments; i++) {
>  		struct kexec_segment *ksegment;
> =20
>  		ksegment =3D &image->segment[i];
> -		pr_debug("Loading segment %d: buf=3D0x%p bufsz=3D0x%zx mem=3D0x%lx mem=
sz=3D0x%zx\n",
> +		kexec_dprintk("segment[%d]: buf=3D0x%p bufsz=3D0x%zx mem=3D0x%lx memsz=
=3D0x%zx\n",
>  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
>  			 ksegment->memsz);

here too etc...

