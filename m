Return-Path: <linuxppc-dev+bounces-5548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BB1A1B5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 13:25:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfcTs6pWBz30Qb;
	Fri, 24 Jan 2025 23:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737721537;
	cv=none; b=ibErWv2PnERB/ApG4SR63qocgLaKRld4DF0rYOsK2YBRSo+qgE41Zm0WwqFJyodYJZh/oi7Pn0UXOg3mwo4EZsG95vRyH3tNOrWFxDjPrkbGLFQiZIH8vRRg3nKXl6bZl3r5UFcdZv2E1N8N1uumrejGjc9lOVTT74197cKYY5oS9I7R7o/5CAHPC954Eigy/rK/0/IFN8GF81zr/hg+2I92VgiOK8hh//SttC31bpoowZkHYQktqCdmxWugV7dhw6ivEsRGFnqs7Ob2qlVQ0ez/zI6G9lITtTbYCRqDscu1dAbZdtNYxrLX/RIiFxfPeX2XTVs13zwj16/n0Mzwzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737721537; c=relaxed/relaxed;
	bh=55WCFRWqtOQgvKOXjNcufQxZKA0z5u3iLymUeHT3mPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKluUw+n+5AMlKm6BWn5VCznQ2h+Z0cT/irW2e1CXOdTJJJmuF+1331xK3TJhR+mbm9CgmD60TE3behxCmEJNNarwxOA1GNWKwETHw+cJIADADlGM8Rb1Lph5QsHWafmRsmzMVDYRryh2Vfe6yQHccNHrHM9TyNP3LuEopzupjkQ3ayE8WXGTm9zkVlH+zRYGi+C3xCpDa7T8bGcGKENefbqWz4eKl31ysgKhERP//TbTqpOOox7E5spudrK7lKY9r76UyBOPMkOUo5XtMtIhtH/Y5lgZXqtXf4QTAVVa/1DXzEOseCQk6hU78tvI7hPl7M+cbL8KBM/sYyyz0jopw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKPAqd4L; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gKPAqd4L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfcTr2zmJz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 23:25:35 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2163b0c09afso38064775ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 04:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737721532; x=1738326332; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55WCFRWqtOQgvKOXjNcufQxZKA0z5u3iLymUeHT3mPE=;
        b=gKPAqd4LyP4M15268wQh3s0/wy6+D3SmuoXEkxvrm2aiYSTDiWRbIu52eCApiwYRQx
         j0USQ6Hk4uL2LL3gB7N398OBM1MYfJJ0zqHDCCmH1iOueA6V4T1+B8JwvyPMpHWl14dR
         Pcf94v/Oyx/PGM34NT/a0+bo5T/Y3gAC+LjDHwa3WBCIF6OKkjYce5MIflqnSDOjMgRt
         th0kZv+PRa4ge4yZNOoA+1ATCd/PF8dQaNRxIfAqKy5Rs5D4aPiJ29aKNaXC2B/ipr0n
         TThAoObWOIxrtsOkESOPqdere0hF5WFBfxZtvVoPdVoEO+oiYyc+0sG4LgcVX+J0UkSf
         PAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737721532; x=1738326332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55WCFRWqtOQgvKOXjNcufQxZKA0z5u3iLymUeHT3mPE=;
        b=lrspHa58yTtrL3vbbRn6/TFdDSsrFCorl2wky0Z7v1PyjIKEcxis51nKoNgogNn34Y
         uyJxclT0pWlG0mQzU46p8ag7vIMd+4668j4eLEiscAZqqN0TwaYuC436IskODBSaVpDB
         G72HGixgdGAEmmQJnEeDROTFOF7g4DQxkR/nlGHaPEKmlFTvYqCFOxXGocDKRl8/wwwA
         ecMbOiey/qKqlW8gUtJx/RDRx+jttxrZscGV5Wt37INafHCZDi3OsQv504GCK6RgYRvT
         tRQzeUYRo+Y5ll+7rskhi82/t34hNGVrG2UYvmjyOME3ms7XV3+eR0DOZEB1l/kq3ee7
         zrPw==
X-Forwarded-Encrypted: i=1; AJvYcCX7wK37inbFvNHnvzd5ddJuUPuHxaFUHER03OWufJ/pXaJk/tYn6XnEuq/cOdcnctimFy/Vvs3vvv4o/OU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzWQB1mXvfskLA5AsHrch51lYvTbZRFI5+oADMQVFu3oxclNeW
	Dfv9Rl/q+nbfGw1d6lo15YIGYgA+cyvEa4lwKFCl66M9l1rWNEIA
X-Gm-Gg: ASbGncsSWCQzErCmJgo0b1clSaypaXqLVBn4qYpA4PmWucu3pT9I3QhU2xhTWhHnvcu
	mM3QtKWfcFhcCZxTscBgDZaTMmUvELDiimo4edwyEaMf4G4+5eHD7mbIpAmJfAR3ESNVsGYUSdK
	8f/N3RoyKNx048wlQDWrxeOBb1MA1/wzgEFEh+olnkwtUw8mUNeN/MqhFrv1LHqFeipFQpH2qrr
	JjXGGRqEHubvyP49rem+DV6/etSH+TRSbXd3VTZ4PBlGJkVuGuzdq69VpkWOw/h8bAGWNbcOTqX
	5s7l
X-Google-Smtp-Source: AGHT+IETJBFXpUqamvBLU8grXxKZQ+AY2R3EQGkw24VF2qKGHMZ9H+XRVksfh9jlL0WFu+e288uaAA==
X-Received: by 2002:a17:902:cecd:b0:216:6f1a:1c77 with SMTP id d9443c01a7336-21c355e8942mr497666785ad.43.1737721532424;
        Fri, 24 Jan 2025 04:25:32 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da424f17esm14909795ad.255.2025.01.24.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:25:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C948B4208FB6; Fri, 24 Jan 2025 19:25:27 +0700 (WIB)
Date: Fri, 24 Jan 2025 19:25:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
	sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
	amachhiw@linux.ibm.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/6] powerpc: Document APIv2 KVM hcall spec for
 Hostwide counters
Message-ID: <Z5OGt7AnKZaH-Zu-@archie.me>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
 <20250123120749.90505-2-vaibhav@linux.ibm.com>
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
	protocol="application/pgp-signature"; boundary="XzZLEL+AGxInZNaN"
Content-Disposition: inline
In-Reply-To: <20250123120749.90505-2-vaibhav@linux.ibm.com>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--XzZLEL+AGxInZNaN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 05:37:43PM +0530, Vaibhav Jain wrote:
> diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/ar=
ch/powerpc/kvm-nested.rst
> index 5defd13cc6c1..574592505604 100644
> --- a/Documentation/arch/powerpc/kvm-nested.rst
> +++ b/Documentation/arch/powerpc/kvm-nested.rst
> @@ -208,13 +208,9 @@ associated values for each ID in the GSB::
>        flags:
>           Bit 0: getGuestWideState: Request state of the Guest instead
>             of an individual VCPU.
> -         Bit 1: takeOwnershipOfVcpuState Indicate the L1 is taking
> -           over ownership of the VCPU state and that the L0 can free
> -           the storage holding the state. The VCPU state will need to
> -           be returned to the Hypervisor via H_GUEST_SET_STATE prior
> -           to H_GUEST_RUN_VCPU being called for this VCPU. The data
> -           returned in the dataBuffer is in a Hypervisor internal
> -           format.
> +         Bit 1: getHostWideState: Request stats of the Host. This causes
> +           the guestId and vcpuId parameters to be ignored and attempting
> +           to get the VCPU/Guest state will cause an error.
>           Bits 2-63: Reserved
>        guestId: ID obtained from H_GUEST_CREATE
>        vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
> @@ -406,9 +402,10 @@ the partition like the timebase offset and partition=
 scoped page
>  table information.
> =20
>  +--------+-------+----+--------+----------------------------------+
> -|   ID   | Size  | RW | Thread | Details                          |
> -|        | Bytes |    | Guest  |                                  |
> -|        |       |    | Scope  |                                  |
> +|   ID   | Size  | RW |(H)ost  | Details                          |
> +|        | Bytes |    |(G)uest |                                  |
> +|        |       |    |(T)hread|                                  |
> +|        |       |    |Scope   |                                  |
>  +=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>  | 0x0000 |       | RW |   TG   | NOP element                      |
>  +--------+-------+----+--------+----------------------------------+
> @@ -434,6 +431,29 @@ table information.
>  |        |       |    |        |- 0x8 Table size.                 |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0007-|       |    |        | Reserved                         |
> +| 0x07FF |       |    |        |                                  |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0800 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Management Space      |
> +|        |       |    |        | for an L1-Lpar.                  |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0801 | 0x08  | R  |   H    | Max bytes available in the       |
> +|        |       |    |        | L0's Guest Management Space for  |
> +|        |       |    |        | an L1-Lpar                       |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0802 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Page Table Management |
> +|        |       |    |        | Space for an L1-Lpar             |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0803 | 0x08  | R  |   H    | Max bytes available in the L0's  |
> +|        |       |    |        | Guest Page Table Management      |
> +|        |       |    |        | Space for an L1-Lpar             |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0804 | 0x08  | R  |   H    | Cumulative Reclaimed bytes from  |
> +|        |       |    |        | L0 Guest's Page Table Management |
> +|        |       |    |        | Space due to overcommit          |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0805-|       |    |        | Reserved                         |
>  | 0x0BFF |       |    |        |                                  |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0C00 | 0x10  | RW |   T    |Run vCPU Input Buffer:            |

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--XzZLEL+AGxInZNaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ5OGsAAKCRD2uYlJVVFO
o7OeAP9tEH+A4dQ48bRCel39A2tQlrbj3I/kc+cVpBTmLv0LTQD7Bo8tR95ewgW0
PGPhuxL/z3ZBbGPd1ZWZmy3IGQYkrAE=
=CFqD
-----END PGP SIGNATURE-----

--XzZLEL+AGxInZNaN--

