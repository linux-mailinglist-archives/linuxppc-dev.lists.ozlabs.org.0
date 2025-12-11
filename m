Return-Path: <linuxppc-dev+bounces-14721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C103CB50F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 09:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRldj2xHvz2xQr;
	Thu, 11 Dec 2025 19:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.24 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765440649;
	cv=pass; b=mZrO1g2ZEiFJ8nebCs7hpn9UHbp6sod5crRiaqSBmlSBOv5pazVqP6uOUsfj29eOCS73XdGVs5mJVWfbhkulBELEmw7f5I5fZaDPJzY9907y7ltQrIT0y0e+VABHZRcyjIHsRD4lCHBvIk69Bp/Vn3zz4G+kLEf9g+exnn2tjM93y+u3ByK/gMxBYAfFPD1v0ARb1Qw3obrciiZdfSQTgPt3jKFV69cW9ySdgl/tm42F664acDBy+ZXaXDpXdDIM1NxtoLhH5m6QoP4xfnq3YJWlrWAaTC67CDPgJQx91oC+BpirwPlWqJkwHOURo1zQ/UC1cH3zeVhKYOPcfWJGXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765440649; c=relaxed/relaxed;
	bh=EfGUe/ljR7eBkSXCwTp1X7xvjftYne8g/pCSTE57Onw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=LZ7RKU3/dTPKCR4hs/pm/y4+7Eo50k6me2vXP8lfFX5UQOVGpRnSTqAeYQhpwhloAVZeYAfNpUOw+588bVtZcWyiIyEvsrLCnXabWohN3Zc1vGizQoroNrsXW2A/Ee3Fs2vbi0mZem3ZmCaXU1wtSiswOjRAXKzAmx6+5DSj+H+/2RdUIBnRJiJRLjzrEvzID8t7J2QPYNYD0JMwZFQfnQRhh7rgJPzJK/S9cUHGVOB7NZAl5l9pROUH7Y8UseFRw3VNT+M5Ns2it+oMkpvaZ7pi5a54AT8h8qdoWGHf+Aey/T/hPi3xg9kt7oVdyAmOe7kWzCK9XMblh4LdIuJXHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DYwmv3zK; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=I7d++Ivb; dkim-atps=neutral; spf=pass (client-ip=85.215.255.24; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=DYwmv3zK;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=I7d++Ivb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.24; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRldd55ySz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 19:10:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765440630; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=J2Ly441HCP/itKrF1+53d7cdzK1CrW0RgVu6qgMPCGA2czeB7lrQxpcKPqghDCz29W
    OwJnf381enGzn1M+q0kPZ4pEXFyPsAXjAj2qkg0CyJtxxeHLKV4VfQQrk3LMDQjbzLXH
    z/22LDGkw46r4SxATsCtyyBJuv4uwQgGvopz332nUOF9cY2u8WHQQ5hDMDDGiqskzwmA
    dtIlmwr+qgLZzUs7rsZt9PijZ5m6yS+GZmwNSVF516BH6L27P3zeYR9qk7k5H3PL2Gv4
    WE2jqqTXmiFw79MWr3xOnFZi4FwsxYsa6+4ZTkNWp9qMabuiKWLkk8ZJhV9FoRji8Ge0
    CPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765440630;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=EfGUe/ljR7eBkSXCwTp1X7xvjftYne8g/pCSTE57Onw=;
    b=s74x3IZb8Zk/o+5S44fwHBj/HL/FuSNl3METWRFwwUNii5n1fPLNaPaHfz7ipJIjtZ
    +XHbCUtNbRWOxdtdQsrM/WaBUKC0I4LHd2BCLY1iCg/ik1kMYcJAGhnZd4CJ4vdaYoBb
    DP4A7iite8EvPQtcd4QlGKyj9/VysiNsqUVjWa2gzgYYNfaNkJfTLS4oylOUCgQvRoNW
    f0n824ZXH3YPo3wg7vfNNq5CcAkBjmphWu6+VAsNveOvdlYRFD2KZKMVJp0BuiWXwfZ/
    AR7jsMEYOsUiA3b5h4cE8VEkqyFfuV9JYqUHA3ZaqZcEa2ti0EDS87tD2CXIXUCejZTa
    OK8Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765440630;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=EfGUe/ljR7eBkSXCwTp1X7xvjftYne8g/pCSTE57Onw=;
    b=DYwmv3zKuibWsP53WwvXO+C3zXiI/et1avKRrc959aWfvVSWRkBkie5LgrTJqplhUn
    vwSltBTDr0hSGc/TngrKN0kQS45YS2AHnRx5LOW3/bHiZKYhRi9/NP6B8WCVehD2lT8R
    SAgbf5s9o6SB6k/l2ZCOVtp9BR2IGo/pnIHxRexVsXauIrk0GAZg+kmkLQG+9suhlNaa
    wmiG8qO8rdauk8GNh50qwLv0/juiW4uU9FyvB8baHeJqm53dMQfA8jmwLNMJHmkZ7iGM
    7cuFyva5rS5aXS9mQDCvvd7lpSuJYu1M5GrW3mqud1ie9+Ryl+URzaJA/7PHdhEAWHVN
    gGpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765440630;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=EfGUe/ljR7eBkSXCwTp1X7xvjftYne8g/pCSTE57Onw=;
    b=I7d++IvbXLz3Qny9LPpkYZTt13wJG9u4JukMdljezK4pCD+Z4Y6weRgIcLzd3iiJxw
    WezC51PDyT9+oNuwx1BQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3s3yRXXtGyKvR6nIoGGaKfQzR/d8qY8tq9Po="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.1.0 AUTH)
    with ESMTPSA id efe0e51BB8AT2ZF
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 11 Dec 2025 09:10:29 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Thu, 11 Dec 2025 09:10:18 +0100
Message-Id: <04A102A2-C7DF-4C42-AB3A-2D5C2B9B9FAF@xenosoft.de>
References: <5DADF74C-98ED-4557-82D8-77E2B414FFA8@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <5DADF74C-98ED-4557-82D8-77E2B414FFA8@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 11 December 2025 at 07:27 am, Christian Zigotzky <chzigotzky@xenosoft.d=
e> wrote:
>=20
> =EF=BB=BFHello Christophe,
>=20
> I was able to reduce the patch.
>=20
> The following modification is responsible for the boot issue:

Christophe,

This is the new reverting patch:

>=20
> diff -rupN a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interru=
pt.c
> --- a/arch/powerpc/kernel/interrupt.c    2025-12-09 06:57:20.717347165 +01=
00
> +++ b/arch/powerpc/kernel/interrupt.c    2025-12-09 10:24:37.357301725 +01=
00
> @@ -38,7 +38,7 @@ static inline bool exit_must_hard_disabl
> #else
> static inline bool exit_must_hard_disable(void)
> {
> -    return false;
> +    return true;
> }
> #endif
>=20
> - - -
>=20
> After reverting this modification, the kernel boots without any problems.

After reverting the modification with this patch, the kernel boots without a=
ny problems.

>=20
> Please check this modification.
>=20
> Thanks,
> Christian


