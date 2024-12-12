Return-Path: <linuxppc-dev+bounces-4042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7B9EE54C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 12:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y89cw30MBz30Tc;
	Thu, 12 Dec 2024 22:45:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734003904;
	cv=none; b=fxT98JOa2vKxuUyf/I+312e3cf1FT2DonFS+ut9ojohrWa+L7Fdke/5L1OlphKa9//Ylha8p2OaLhdYZd80PdkcudRen/JVA4natwgI0CAkH5EOaLcW+TlgTniZFA4p/fgMMIq8g5wWWNJs0QV6aPQUXu9Y7gOptXnN8ijZRPmbhW8kQl4cCPbpAtB/JYy30eITpQbNvTfDtMTg6wPH7qU7MzK4FBU8eua7WWGi0S+5HqVo56HlVL3b1DZXvkwI4l9GZ3E5r2L38NL7D+rs/kX38zic/UgtoKN3wVP9abRVqZ9IJTRjyXyLaAJQt9VHfIM5HO7is5Hatmba9Or2AqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734003904; c=relaxed/relaxed;
	bh=H67+ULJY8BlrayRyzJmF+1YLc4VM1o3ZbYZqf7GEUjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7iT6WqO7+rMq8SxjVQf5mLdVc2Xa97Az0coxDT/yYMbsvOP13BX1801EUVZoyxAnKo3F95sCaVlwsMpUpb253D6kK1cQxAx7Ldcpk+YoEXBbyP1mBXs2Zm8I2b9iYoclFikyAExRc03qs14FaS2BjNHUgrz+bCKxx9VFHghCq93W9k4xLZnWbkvjWPD4xIdBk8yeF7IxkMjPAK9BqQmf/ZdbjyZU/xlKfpONACaTfIPRddtwbfR50pW+8GQu9MINW3GFStwZtKdk0Yw15CJo8DZSWlwIPsEZ489FgNc1RbdKAvezz7Y6YJB1ugdZjwRO2BMpjdtuPrkC4QXxJeZtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fZ7PHaIa; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fZ7PHaIa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y89cv19Qvz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 22:45:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB030A42749;
	Thu, 12 Dec 2024 11:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C692C4CED1;
	Thu, 12 Dec 2024 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734003899;
	bh=4GmCDohNAOfCN5wWOW+nZPuvP+Y3UIn9m30OSN5j1JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ7PHaIaPPzTVBHTSLkX1+O9i3Zzay8xBUl2gIG3heoj6Z+fk9meBl13EQtHQApDu
	 Yw94mtEVg7nI8104jxTR94i4yw/MJJfGSIbgfp4ciEyhuk60ZjABeF4RAtV6cozv/I
	 EGNGxUK2lp3f1g1KWx1NHWA8TvA/hfjKSjxFLH2UPn1Qx2/4rCVe38ivLVqwgjQkJQ
	 fiBtT3zOeOtBw8cZRr8uVg3xQKACPhUNyLhUm2B2v7uXXG5XoBaSVVV9RhhmldzA0w
	 wvtEu88criAqDPQ7R6jqh6P1tx4ccozYrt+Xoj44g5NveBFbwVr9Z9HLpvInw6lyxL
	 PgsQDvsJRFdkg==
Date: Thu, 12 Dec 2024 11:44:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
Message-ID: <58b4a167-5a13-49b2-9b08-58c3041b772b@sirena.org.uk>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
 <20241212074509.3445859-5-shengjiu.wang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xCorpfkhpxX1YyjE"
Content-Disposition: inline
In-Reply-To: <20241212074509.3445859-5-shengjiu.wang@nxp.com>
X-Cookie: You can't push on a string.
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--xCorpfkhpxX1YyjE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 03:45:07PM +0800, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the compress framework, user can use this function with
> compress ioctl interface.
>=20
> This feature can be shared by ASRC and EASRC drivers

This breaks an x86 allmodconfig build (using GCC 13):

/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:68: warning: =E2=80=98s=
truct snd_compr_task_runtime=E2=80=99 declared inside parameter list will n=
ot be visible outside of this definition or declaration
  186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct =
snd_compr_task_runtime *task)
      |                                                                    =
^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98asrc_=
m2m_device_run=E2=80=99:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:212:26: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  212 |         in_buf_len =3D task->input_size;
      |                          ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:279:13: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  279 |         task->output_size =3D out_dma_len;
      |             ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:451:49: warning: =E2=80=98s=
truct snd_compr_task_runtime=E2=80=99 declared inside parameter list will n=
ot be visible outside of this definition or declaration
  451 |                                          struct snd_compr_task_runt=
ime *task)
      |                                                 ^~~~~~~~~~~~~~~~~~~=
~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl_a=
src_m2m_comp_task_create=E2=80=99:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:465:13: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  465 |         task->input =3D dma_buf_export(&exp_info_in);
      |             ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:466:24: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  466 |         if (IS_ERR(task->input)) {
      |                        ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:467:35: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  467 |                 ret =3D PTR_ERR(task->input);
      |                                   ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:475:13: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  475 |         task->output =3D dma_buf_export(&exp_info_out);
      |             ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:476:24: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  476 |         if (IS_ERR(task->output)) {
      |                        ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:477:35: error: invalid use =
of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
  477 |                 ret =3D PTR_ERR(task->output);
      |                                   ^~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:523:48: warning: =E2=80=98s=
truct snd_compr_task_runtime=E2=80=99 declared inside parameter list will n=
ot be visible outside of this definition or declaration
  523 |                                         struct snd_compr_task_runti=
me *task)
      |                                                ^~~~~~~~~~~~~~~~~~~~=
~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl_a=
src_m2m_comp_task_start=E2=80=99:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:528:35: error: passing argu=
ment 2 of =E2=80=98asrc_m2m_device_run=E2=80=99 from incompatible pointer t=
ype [-Werror=3Dincompatible-pointer-types]
  528 |         asrc_m2m_device_run(pair, task);
      |                                   ^~~~
      |                                   |
      |                                   struct snd_compr_task_runtime *
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:92: note: expected =E2=
=80=98struct snd_compr_task_runtime *=E2=80=99 but argument is of type =E2=
=80=98struct snd_compr_task_runtime *=E2=80=99
  186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct =
snd_compr_task_runtime *task)
      |                                                             ~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~^~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:534:47: warning: =E2=80=98s=
truct snd_compr_task_runtime=E2=80=99 declared inside parameter list will n=
ot be visible outside of this definition or declaration
  534 |                                        struct snd_compr_task_runtim=
e *task)
      |                                               ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:540:47: warning: =E2=80=98s=
truct snd_compr_task_runtime=E2=80=99 declared inside parameter list will n=
ot be visible outside of this definition or declaration
  540 |                                        struct snd_compr_task_runtim=
e *task)
      |                                               ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:10: error: =E2=80=98str=
uct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_create=E2=80=99
  623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
      |          ^~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: warning: excess ele=
ments in struct initializer
  623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: note: (near initial=
ization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:10: error: =E2=80=98str=
uct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_start=E2=80=99
  624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
      |          ^~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: warning: excess ele=
ments in struct initializer
  624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: note: (near initial=
ization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:10: error: =E2=80=98str=
uct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_stop=E2=80=99
  625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
      |          ^~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: warning: excess ele=
ments in struct initializer
  625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: note: (near initial=
ization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:10: error: =E2=80=98str=
uct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_free=E2=80=99
  626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
      |          ^~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: warning: excess ele=
ments in struct initializer
  626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: note: (near initial=
ization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl_a=
src_m2m_init=E2=80=99:
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: error: =E2=80=98SND=
_COMPRESS_ACCEL=E2=80=99 undeclared (first use in this function); did you m=
ean =E2=80=98SNDRV_COMPRESS_AVAIL=E2=80=99?
  701 |         ret =3D snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "ASRC=
 M2M", compr);
      |                                         ^~~~~~~~~~~~~~~~~~
      |                                         SNDRV_COMPRESS_AVAIL
/build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: note: each undeclar=
ed identifier is reported only once for each function it appears in
cc1: some warnings being treated as errors

--xCorpfkhpxX1YyjE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdazLUACgkQJNaLcl1U
h9DcEgf+OJCZW0jgiKXMBoR3Ew+s4HvrHC3fxP0nd/Prc6FZAauL78YdYhJce2IO
Bp2bONmgi4zDJCJM9+SR1kEonO1EI0hCluisw/T588uAXQfGe4bukCis09k7zaEn
/w6FL5Na9sIbOGVLyEImrEDVgcm/XcekklQTrIifLdd51FWA4/9BYwV3LSKpaDX0
icGNN5H9gKADDidG2fWdPtndf6mMtkxOmvW9/lGADAYRCRCuwjRSxfCgd4wN8MQs
NithgGAj0D9hihQ5VNSo9+HYVdzBZ+9rFVEjiUD4WxdqSDUjmVFZJAqQfRzOaqsz
kEcfFqKySi1g/P4F5smjSPnIr7A8AQ==
=C/Kj
-----END PGP SIGNATURE-----

--xCorpfkhpxX1YyjE--

