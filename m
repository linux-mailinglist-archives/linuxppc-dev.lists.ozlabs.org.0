Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8220CE45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 13:41:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wQYX3nSSzDqNm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 21:41:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wQWg6YmtzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 21:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49wQWg5Dgyz8tWB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 21:39:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49wQWg4bdfz9sSF; Mon, 29 Jun 2020 21:39:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=ptesarik@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49wQWf6lK9z9sQt
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Jun 2020 21:39:42 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DCA4AD6A;
 Mon, 29 Jun 2020 11:39:38 +0000 (UTC)
Date: Mon, 29 Jun 2020 13:39:33 +0200
From: Petr Tesarik <ptesarik@suse.cz>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
Message-ID: <20200629133933.0787f562@ezekiel.suse.cz>
In-Reply-To: <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
Organization: SUSE Linux, s.r.o.
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/D5Q_Btj.Z_5nJ6kJU141Zr9"; protocol="application/pgp-signature"
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/D5Q_Btj.Z_5nJ6kJU141Zr9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hari,

is there any good reason to add two more functions with a very similar
name to an existing function? AFAICS all you need is a way to call a
PPC64-specific function from within kexec_add_buffer (PATCH 4/11), so
you could add something like this:

int __weak arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
{
	return 0;
}

Call this function from kexec_add_buffer where appropriate and then
override it for PPC64 (it roughly corresponds to your
kexec_locate_mem_hole_ppc64() from PATCH 4/11).

FWIW it would make it easier for me to follow the resulting code.

Petr T

On Sat, 27 Jun 2020 00:34:43 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> Some archs can have special memory regions, within the given memory
> range, which can't be used for the buffer in a kexec segment. As
> kexec_add_buffer() function is being called from generic code as well,
> add weak arch_kexec_add_buffer definition for archs to override & take
> care of special regions before trying to locate a memory hole.
>=20
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  include/linux/kexec.h |    5 +++++
>  kernel/kexec_file.c   |   37 +++++++++++++++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 1776eb2..1237682 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -195,6 +195,11 @@ int __weak arch_kexec_apply_relocations(struct purga=
tory_info *pi,
>  					const Elf_Shdr *relsec,
>  					const Elf_Shdr *symtab);
> =20
> +extern int arch_kexec_add_buffer(struct kexec_buf *kbuf);
> +
> +/* arch_kexec_add_buffer calls this when it is ready */
> +extern int __kexec_add_buffer(struct kexec_buf *kbuf);
> +
>  extern int kexec_add_buffer(struct kexec_buf *kbuf);
>  int kexec_locate_mem_hole(struct kexec_buf *kbuf);
> =20
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index bb05fd5..a0b4f7f 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -669,10 +669,6 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>   */
>  int kexec_add_buffer(struct kexec_buf *kbuf)
>  {
> -
> -	struct kexec_segment *ksegment;
> -	int ret;
> -
>  	/* Currently adding segment this way is allowed only in file mode */
>  	if (!kbuf->image->file_mode)
>  		return -EINVAL;
> @@ -696,6 +692,25 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	kbuf->memsz =3D ALIGN(kbuf->memsz, PAGE_SIZE);
>  	kbuf->buf_align =3D max(kbuf->buf_align, PAGE_SIZE);
> =20
> +	return arch_kexec_add_buffer(kbuf);
> +}
> +
> +/**
> + * __kexec_add_buffer - arch_kexec_add_buffer would call this function a=
fter
> + *                      updating kbuf, to place a buffer in a kexec segm=
ent.
> + * @kbuf:               Buffer contents and memory parameters.
> + *
> + * This function assumes that kexec_mutex is held.
> + * On successful return, @kbuf->mem will have the physical address of
> + * the buffer in memory.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int __kexec_add_buffer(struct kexec_buf *kbuf)
> +{
> +	struct kexec_segment *ksegment;
> +	int ret;
> +
>  	/* Walk the RAM ranges and allocate a suitable range for the buffer */
>  	ret =3D kexec_locate_mem_hole(kbuf);
>  	if (ret)
> @@ -711,6 +726,20 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	return 0;
>  }
> =20
> +/**
> + * arch_kexec_add_buffer - Some archs have memory regions within the giv=
en
> + *                         range that can't be used to place a kexec seg=
ment.
> + *                         Such archs can override this function to take=
 care
> + *                         of them before trying to locate the memory ho=
le.
> + * @kbuf:                  Buffer contents and memory parameters.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int __weak arch_kexec_add_buffer(struct kexec_buf *kbuf)
> +{
> +	return __kexec_add_buffer(kbuf);
> +}
> +
>  /* Calculate and store the digest of segments */
>  static int kexec_calculate_store_digests(struct kimage *image)
>  {
>=20


--Sig_/D5Q_Btj.Z_5nJ6kJU141Zr9
Content-Type: application/pgp-signature
Content-Description: Digitální podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAl750vUACgkQqlA7ya4P
R6dpTAf/dLQ6L45/sKP4CXfNn4HbDkmtImkYe5MjG/bvbhQrgLZxll54L0YT2bt/
Xml4Bam2sLd761+VlBcJaQXLojyENgxLEpyAN2XXCFW+8YSipIRrpvmX8RrP+Szr
PbYupPmCs8Y7GS6iptYE8nASFVQJm4JS4h/HZCsyUcZUpe+lrlM2BkO42FP+X8L9
KdDubtEyyyWzwXx1PWpfq+I5IDIVKaIaCvXBeOp8OIjnHE4mtRcnMfahD2TBg3LM
2ga/b4txkwuVkrnVuBaAjMmcK95nlth5oc0NFGMvyoLFUiS48fHYhwFWn7gYQW54
08VDEBmerlqmS/Qvkym6ERI2MsuC6A==
=M+ug
-----END PGP SIGNATURE-----

--Sig_/D5Q_Btj.Z_5nJ6kJU141Zr9--
