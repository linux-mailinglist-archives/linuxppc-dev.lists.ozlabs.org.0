Return-Path: <linuxppc-dev+bounces-17777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H/gJkedqWnGAwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:12:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EE2143DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRY100ZKNz3c5y;
	Fri, 06 Mar 2026 02:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772723523;
	cv=none; b=J2TXi9EPR3yANY9UUMeu4UIfddhcJnChtBoCi0JGYTG9FoXxRmSv/UpFpWJse0Y4Ok+X5VjgWBy5SdNlJE3VhE0nhrEwyaOccmr0OXXJhyHZ/0oBfXFmoygKYe15BVo7usF4OiSDq1x0j3HKJMH0dapfHWgLvQ1lxXvubNkZLyGWr3MSMOca6UbTZi+bcXaaV7BtFoclzEupSq3dNl2PRVh/D1aty1Kf6qAhl4Iw+RjoZR+cxYHh14YH8kSaIGHdAFdm9zRqzz5A5xeFnh+JOIxj/x3CDrUjLu7daQgMIJD95i+ArZV6TZVPJQHcQ8XYmeC4mCwR+B/OxqTC21+GrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772723523; c=relaxed/relaxed;
	bh=1X3B8ZvjtR5He0Zt/JlxrbXMg/KalrCLjBQ+uAPKBJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz34DggzrHi56SfTEgGZuUfYD1vjOmVHhVclvZzmSrkOu0eZ/WZwJRPKFH6XXJZmZ4j9ev2q+9JwXqTN865Mq0neZ5qKm1fbzaAoL36ljB16vP0iVBMbVUNWJaXdbBukD1ft8WwdbcOBqQ5rVinm3fB+4O4baAA3C2jz3kpafdjSNRf1B3iXsGK2JvxtbLCRfgqcI8q3aTugyZeg5YstTIpQp5DL0iell4+qrP3Cyx/RBuKabxfxyp70ULX262wRhNyHr4i5C1d5z4x4aLE0Hw8WnykkXgSM+9G1MZDerUz/5KZKwCYUf8DkVHLgWfY9ccVtBROsH0D/Ma6HT9qNgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ex3wCC+J; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ex3wCC+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRY0z0GRJz3c2R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 02:12:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D50A2600C4;
	Thu,  5 Mar 2026 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578C9C116C6;
	Thu,  5 Mar 2026 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723520;
	bh=q1buLjmzD5jbK93Cjaihu7DOmq2FTMtHLYbDWWbjkHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex3wCC+JaWlFApWmQC1RpIrMzQdZ5NuE1BkNO9eSb2gDMStp0cduTuMmGASi+XXOB
	 hlQICsyFRIkfjXYEzIACShBO8fmdzIzB2yGTqVJHhJYLHstIredee+wI/nti5JlRit
	 dEl/2+yuwEgVTPOopoUYST9Ai3149HUVFuIivMmkks7aAEmdAsz8TvUwo5M6/dEf7F
	 BZ/oAwTofzldPDt54iqsSicV2lO6Yw89HM1uk87FiXMxpR5NCKFilbpoRVPH48l/Ts
	 pmyTyICj0Nh6K7yZ+o+U3zz90xD+xhlkr7EW/U2cwe6e5QpFzWOmXwIif0tEKwhzyL
	 FRklqZgQXl4NQ==
Date: Thu, 5 Mar 2026 15:11:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
Message-ID: <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
 <20260305031031.3808182-2-shengjiu.wang@nxp.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UC7QFUi5U5Qdzx8l"
Content-Disposition: inline
In-Reply-To: <20260305031031.3808182-2-shengjiu.wang@nxp.com>
X-Cookie: Onward through the fog.
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: BA4EE2143DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17777-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[freescale.com:email]
X-Rspamd-Action: no action


--UC7QFUi5U5Qdzx8l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2026 at 11:10:29AM +0800, Shengjiu Wang wrote:

> +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.integer.value[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_xr_sx(kcontrol, ucontrol);
> +}

This is racy, what happens if we race with runtime PM disabling the
device so it gets powered off between the check and the call to the
generic function?  I think we need to take a runtime reference here,=20
this is annoying but I can't see how else to do things robustly and
probably in practice there's not much performance impact.

> +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
> +
> +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_xr_sx(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
> +
> +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.enumerated.item[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_enum_double(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_get_enum_double);
> +
> +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_enum_double(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_enum_double);
> +
> +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.integer.value[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_volsw(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_get_volsw);
> +
> +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_volsw(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_volsw);
> +
>  MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
>  MODULE_DESCRIPTION("Freescale ASoC utility code");
>  MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
> index 21b25a11ecda..0cf9d1e7fb14 100644
> --- a/sound/soc/fsl/fsl_utils.h
> +++ b/sound/soc/fsl/fsl_utils.h
> @@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constr=
aint_list *target_constr,
>  			      const struct snd_pcm_hw_constraint_list *original_constr,
>  			      struct clk *pll8k_clk, struct clk *pll11k_clk,
>  			      struct clk *ext_clk, int *target_rates);
> +
> +/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
> +#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbits,=
 \
> +				xmin, xmax, xinvert, xhandler_get) \
> +{	.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, .name =3D (xname), \
> +	.access =3D SNDRV_CTL_ELEM_ACCESS_READ |		\
> +		SNDRV_CTL_ELEM_ACCESS_VOLATILE,		\
> +	.info =3D snd_soc_info_xr_sx, .get =3D xhandler_get, \
> +	.private_value =3D (unsigned long)&(struct soc_mreg_control) \
> +		{.regbase =3D xregbase, .regcount =3D xregcount, .nbits =3D xnbits, \
> +		.invert =3D xinvert, .min =3D xmin, .max =3D xmax} }
> +
> +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
>  #endif /* _FSL_UTILS_H */
> --=20
> 2.34.1
>=20

--UC7QFUi5U5Qdzx8l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpnToACgkQJNaLcl1U
h9BUtwf/SUJrv0BSLPoLx0UoPadMjZdLjMQghGYP+9ZzbYDakVCLWvAeftuYKJDA
M3IZLMBpsa6QT/hM3rQDhRK0+esTlNFhqsvRWCQW0RAnYG2Y/7tSI8enCOieuuLd
ickCQ73DSVWBdRw6TlZMzjqSxEP8ZkscW9+e35aRV66sgIttGP3fMz/g9BQYjMQj
zMDTbduWpfhrsX7T1IfjNFrhfcZLWwS8KgODp87CYw8TVMcMCJmPzlVwORx8gdmt
AHpiMelkUtbMrm31/5IZW4pKAnbg9VjHk8Fyy+6YcvlOJVZ5RHTF78gMBkL3m+Iq
MqKntiVHR6lo0PHUWsey53gTdBKKJA==
=GSRC
-----END PGP SIGNATURE-----

--UC7QFUi5U5Qdzx8l--

