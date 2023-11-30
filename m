Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74327FE76D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SggjW2zbdz3cTm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:53:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perches.com (client-ip=216.40.44.12; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgghz6hVvz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:52:33 +1100 (AEDT)
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 0CD43406F7;
	Thu, 30 Nov 2023 02:52:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 2F8892000D;
	Thu, 30 Nov 2023 02:52:25 +0000 (UTC)
Message-ID: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
From: Joe Perches <joe@perches.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Date: Wed, 29 Nov 2023 18:52:24 -0800
In-Reply-To: <20231130023955.5257-3-bhe@redhat.com>
References: <20231130023955.5257-1-bhe@redhat.com>
	 <20231130023955.5257-3-bhe@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 2F8892000D
X-Stat-Signature: gwk7qi3h7jx8h1ywf1jic8xo76gqerwm
X-Spam-Status: No, score=-3.82
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19dPUefOesSFHLQCs3wqOW/oGlv3aC7z+4=
X-HE-Tag: 1701312745-366478
X-HE-Meta: U2FsdGVkX18k/ADXByHc+CtueZc2/kIRg2iYeavR6SwxdbkG44laEheGJWfEZEWXVPPjQNlGsgWVgExQ2v2SkjkkfNjpPwEMSuNPMyCDovT0AEEC3qeJ3Q3CanYRUyaIkLf9UCVzbPHogNji1emX5sy1KMlEpsNMU2L1IT5Ygh0f8/d2RbC7l5Zlkk01sF8weznUFCSh7sTGbvtjt1bjs0D9vOhDdBlZRMDNhbUzmGZ+P97DoYPvnsvnrduPVTPJ/denAd96V06q4DDxaFl1zt06dspwDHAATuNX205GsU5+pYEk/u0vlxrjfS1T3iX3
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, nathan@kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.

trivia:

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
[]
> @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  		phdr->p_filesz =3D phdr->p_memsz =3D mend - mstart + 1;
>  		phdr->p_align =3D 0;
>  		ehdr->e_phnum++;
> -		pr_debug("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, paddr=3D=
0x%llx, sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> -			ehdr->e_phnum, phdr->p_offset);
> +#ifdef CONFIG_KEXEC_FILE
> +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=3D%p vaddr=3D0x%llx, pad=
dr=3D0x%llx, "
> +			      "sz=3D0x%llx e_phnum=3D%d p_offset=3D0x%llx\n",
> +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> +			      ehdr->e_phnum, phdr->p_offset);
> +#endif

Perhaps run checkpatch and coalesce the format string.

