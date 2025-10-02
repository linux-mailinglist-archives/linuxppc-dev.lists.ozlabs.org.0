Return-Path: <linuxppc-dev+bounces-12640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA5BB5607
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 23:02:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd43t4pG3z3chZ;
	Fri,  3 Oct 2025 07:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=173.37.142.95 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759438922;
	cv=pass; b=oSXOyv9aQS8sXr/6he4pMrO3nS9HJCkjLInpdQJCr35x3jbZSjQfaRk6/47qxbh+/J5Mt1DlVT1DZDzBZCRmG55VJogBwSD6YzWpfDppvYotOF2kwAcC0SVvOGfanhiBkTkUvuchLZz4Iv/BPAR1k2Nnk85LHXszh5iLa5hSZ/L6q3X/QNsOD1a/BHdEmBBC3/DVgtQr92o0rR9NPKcwvk9+SLM/Gru7glTaglmIWuscOaCixeI9lXOuMtJnTIEcsWjuv0tiWGQYyG4D1jCfVf8dO3NZINK2alTHzfTrWMSgNa/YtnD95Q0Y9x/CkAwiVldUFwsKlPnZyIPTeddwCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759438922; c=relaxed/relaxed;
	bh=xGd93bX9ZBRMuEeMK37hA54wHci0UoVOd0Y97cGIA6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bvuJkRcNRLev7GRmcWXBGKi1FtHdcLB4FZOYwnDVDwL60E8NxBGp3auXR2txXFJqCXZJmpeSxaRk+dBSz/gk/nzoujBA3u7lPe784ysW+P+BxwhFkfZrnLjqHj+oPBMhvULJIXNeFDoHf9InT5CYDZQLNQbZjqXKaDt2BH7XhHG72vhqWDXLCj3baKxbl6tPNfTZvoCFjFjHYZcSxh6A+kj7CYLAwhqpqcuOri2eTp24dIPLJh7vbfGW605t4Wm0wZve5Jrf19TvXawKLF1dLYXGadMAaBQaQUrdqjDB206hEmcMYdeTV9McotrODig37i8x/TKLdefK3xzQgJjekA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=LHcSoneJ; dkim-atps=neutral; spf=pass (client-ip=173.37.142.95; helo=alln-iport-8.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=LHcSoneJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.142.95; helo=alln-iport-8.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Fri, 03 Oct 2025 07:01:59 AEST
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd43q6bDJz3chJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 07:01:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1334; q=dns/txt;
  s=iport01; t=1759438920; x=1760648520;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xGd93bX9ZBRMuEeMK37hA54wHci0UoVOd0Y97cGIA6E=;
  b=LHcSoneJauxHPbzE7EBPMK7MYX2D+nBkaqgrZxOpoG+mcBJTmea8mQ6D
   BirhSmCDc61tyIt3HWBK60aeFCm6ayxnuS6JwpLYithzu1Z3P8/xIHSNy
   yBWeZspdH/cLEUSz6pz+Op5MFf+DRkBMhZ8Yi+jBhM+EZqlxqZNzR03An
   1FXGeoZYom8SYGKmFtXUW0fU+HnKdMQJneVPaXUlxI+KOPXoUjBe2IXZ5
   npoFPrB0sgyirXBU7Qq+Wtzey99+qw+DiwpbfSaRhQYbM7aF+/DMVcoO0
   K4SBLcxh4ASEhD28obzLSyvgj4Yzph37oUlSshx8XCqG8yHcx/mbipgOZ
   g==;
X-CSE-ConnectionGUID: qTLXsH52QEGIYGd7B+bN7Q==
X-CSE-MsgGUID: eH17WTmqRQeX3p5N+HquPA==
X-IPAS-Result: =?us-ascii?q?A0A8AACi595o/5AQJK1aHQEBAQEJARIBBQUBQCWBGggBC?=
 =?us-ascii?q?wGBbVIHggUSiGkDhE1fhlWCIQOFeoxVHIsvgX8PAQEBDQJRBAEBhQcCjEYCJ?=
 =?us-ascii?q?jQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGWwEBA?=
 =?us-ascii?q?QMSKD8QAgEIGB4QECElAgQOJ4VTAwECo20BgUACiit4gTSBAeAmGIExAYhQA?=
 =?us-ascii?q?YVshHcnG4FJRIQ/PoRDhkQEgiKBFpAxj1BSeBwDWSwBSwo1DDNtQwOBMksFN?=
 =?us-ascii?q?2gSQHeEFIQegxZygXRXQYFLGIIOcQ8GgRUZSQICAgUCQz5agRAGHAYfEgIDA?=
 =?us-ascii?q?QICOlcNgQR0AgIEgi+BEoIqD4FvA3g9NxQbBp0uLRBSS2WBEJNWgyMBsB8Kh?=
 =?us-ascii?q?ByiN4NxjROZVJkGpAiFDgIEAgQFAhABAQaBaDyBWXAVgyNRGQ/VMIE0AgcLA?=
 =?us-ascii?q?QEDCZNnAQE?=
IronPort-PHdr: A9a23:B9qE8h1QaP+36CQKsmDPmlBlVkEcU/3cJAUZ7N8gk71RN/3l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:vv1dS6IH5yoCH8GUFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENShWBWy
 TEZWmDXP6zfNmGmeNt+aIq19kNQvZHcmIBlTFYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL8g2Yuajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN13MGUGJq1FoN9aLkB/2
 vBHAnMHSE+60rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMHwsYDUXUrsTIJ43mualgmb2WzZZs1mS46Ew5gA/ySQsj+GwbYWLKoPiqcN9k2bB+
 V36+n3DOxwqb8TC73ml62+Ur7qa9c/8cMdIfFGizdZugVuO1nQLA1gaWEWTpfiillX4XMBbI
 kYPvC00osAPGFeDR935WVi85XWDpBNZA4UWGOwh4wbLwa3Ri+qEOlU5ovd6QIVOnOc9RCch0
 RmCmNaBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:SFZl5aMHySGQkMBcT73255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHQYc2/heAV7QZniWhILOFvAi0WKC+UyuJ8SQzJ8m6U
 4NSdkbNDS0NykEsS+Y2nj5Lz9D+qj7zEnAv463pBkdL3AOV0gj1XYENu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVxUi2TPAh3Y8Hz4/fwuNbNZxkACxQ76A+Iow+JxdfBeSSw71M1aR8K5a0t31
 TkvmXCi5lLtcvV9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8RryrplkO0aOSwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yGWfnWDoraXCNXcH4ot69MZkmynimgwdVeJHof
 t2NqWixsJq5Cb77WPADh7zJkpXfwSP0CAfeKUo/gxiuMMlGc1sRMokjQBo+FNqJlOn1Gjhe9
 MeUf309bJYd0iXYGveuXQqyNuwXm4rFhPDWUQavNeJugIm1kyR4nFojPD3pE1wv64VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRC/fZt3d07lutry+vE49euqcJsHwN87n4
 nASkpRsSo3d1j1AcOD0ZVX+lTGQXm7Xz7q1sZCjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZMD/rqPQLVaM90Ns3FKu9vwFUlIbooU4wAKiezS+rwW/nXitA=
X-Talos-CUID: =?us-ascii?q?9a23=3AJIq7RWpwJuljpBS4KUD88jPmUdkZVk3G7CqKGmK?=
 =?us-ascii?q?XKFdGROK/ClW2p5oxxg=3D=3D?=
X-Talos-MUID: 9a23:xvi/Fwb2mL9dROBTuh+12w5eMd5S2qmeU1hQt9YmotS8HHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:00:52 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 3BAAA18000341
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 21:00:52 +0000 (GMT)
X-CSE-ConnectionGUID: 0vCAJSyeSc6isM5CMGRh+Q==
X-CSE-MsgGUID: guAaCnXdSs2JV+iln+9hvw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="36045921"
Received: from mail-ds2pr08cu00105.outbound.protection.outlook.com (HELO DS2PR08CU001.outbound.protection.outlook.com) ([40.93.13.53])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:00:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJDrAxV0nQuEeW0z3gxFOMEgVfYq60oMhFSEM7T+aDGhFL9LwSDQIBu/TrfiYWJwOikBzYNtQC5VxPmgE9LWk34JZqud34w2bAO7MubZyyXSMYajKkctOwfWJO+HJyGJ22umSzvQ5DBmC6zUMwYyv9Lrdk/I5AOlA5883svDe4C/Biusf5mV+Qj6mSSS9dapPpFE9C4kf/7pjvDYLWps4vSfTJSvtQR6YX6iLwskw1J23S0vbgWcn1gaex8hK59k+cPdrWcZ5hGJKhIpqLFPqoSZDkS0bmma8WteTfCQIDg9D56c+FR2xdq4hIqZvmhzh48EI87+t3u/wlY3toFc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGd93bX9ZBRMuEeMK37hA54wHci0UoVOd0Y97cGIA6E=;
 b=eYn2hHCk5xF4gNCTuEkswVdid3wTaZcA3imqjeqq23kE0OyBIB7EnM6qF3DkAsiuc3tTG3uvVv8DvbABDkhqp0AusEKH9A2y4SYUXWO1lj20ZMxTg9w8mD3QQX6MNCI4/TS9oKCAWCOPsea40TLtWIK6oZD0VY/NDVHnGiWSNLVzFJRMi5feR04qEdJZzinTmjSnknNi6ZU24ZWXTFQLWcL6Mi8ho12BnFhK26BkT6aYJ7uU1oRxQZDaB4DkRlR1ALJPS94Z2ECP8R/4Mn8zu25YTytyCMVOos0M3UBRhmcE8ypAi/M7JLBOrFOyRNPzuensIHAwvjHj88nB+GNZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 21:00:48 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 21:00:48 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: Will Deacon <will@kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Rob Herring <robh@kernel.org>, Daniel
 Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>, Ruslan Ruslichenko <rruslich@cisco.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
Thread-Topic: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command
 line
Thread-Index: AQHcM9+g3r8quaaplkmRsz//r+UKeQ==
Date: Thu, 2 Oct 2025 21:00:48 +0000
Message-ID: <aN7n_5oiPjk-dCyJ@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com>
In-Reply-To: <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|PH8PR11MB6753:EE_
x-ms-office365-filtering-correlation-id: 27781819-f9c4-4fba-c143-08de01f6c34d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zwqlhdMFlE/T7l+eA8Zq86LdINOCPXZDBe5A/eslWkcGtQ4/xzrpQFK3RGNu?=
 =?us-ascii?Q?bHwHO7Cu97zVajmHxqv6igPmk6YylTxw3VAm4mnQIlUF/JS76o6ao5zs3vet?=
 =?us-ascii?Q?4rwLLxSEUC5j4+3BEL6BQEsmV1dQ/YwcoCF21n8C7chsSBRDIRQD+QlmfF54?=
 =?us-ascii?Q?SrenJbZyEgAeedHbhsapu9ftWfsDccki6eJ3OV/q7mXJ+U5KqaPiJJoYWndv?=
 =?us-ascii?Q?4JqlMSTHSwshAbWAeg3srxzbhtr3iJ9tpqv3W5W7z2TbxscIe8mcyYACeJOn?=
 =?us-ascii?Q?SYTWkqZG81YuSPlMFjaSpqa5vQz9bMpJ9p+gUgv6uq+fC4uQfvMCbEzvpmks?=
 =?us-ascii?Q?U9C8Q75MHx+kxevkkQmvASVpRr3PLGW4HygSsoyrJUU7fBtQd4E+I/hiN8NO?=
 =?us-ascii?Q?P19KMRN3LRC8zHVmjynMrVvnhzU998qXORxXpfe4DDE+tZ2HGmgX3IthQyqe?=
 =?us-ascii?Q?j8XmHu5P3rI8QjalmidiCOSt3qwKurupJvDp/jxpPWET2Y0EZBGUmw2TnbTx?=
 =?us-ascii?Q?y+BvHIH4+qH0E3Quf2bSQLAWp+VFNLQipgzqII+Z2v+XXPuzJpQ7GvZobpfv?=
 =?us-ascii?Q?F8oIYQ+foXxSW3s/a/gFBKX0qZdaq0ORv/swMXpSuksYnaR1nEkbQYOUM1ed?=
 =?us-ascii?Q?Ft5ntG3V8fiFkGHwSaDfJrJaJnuFSZ78Z5ECTyqfN50j5QRFZfIOF2mPmg0L?=
 =?us-ascii?Q?O1M7+DnY0cKZ5XEbS1D8WFm4pB/5YlzECbmETQ84J+htpLkfSxNjnSknIMK6?=
 =?us-ascii?Q?bGJ9SMLZK96nqbT7R58BxG7gbY3QV/3Wvy4WVgqlMRO/VmYKKi/EwP44P/9f?=
 =?us-ascii?Q?VeN4KX234zg+64B8hkF3csOTnoXnKxwAOFQQtAD0OMtulwDi4tQXbGzQ+uLC?=
 =?us-ascii?Q?KZDDuRoqUi7Xdv9HnMUX4UG1KndyO5D1XcbDx7BY7aSa+SM9V+d8EJDTMbOv?=
 =?us-ascii?Q?OrmabHd+uFovIcbjaNkD/P5SFc0YtaZ8tDu5pAc8gHm2sJVGz62AKu1D9cs7?=
 =?us-ascii?Q?pPb5CVW6FFNuyXqSBP6bwl3To5Agu7vj148+WBgA3f+vm7BhAaGJfpcoxeFg?=
 =?us-ascii?Q?ajboh+sFjR9Ym90R0lDc4VCnfytSHSGKcS3yHELKCCmnH5ZA+kbSfrY1tfqN?=
 =?us-ascii?Q?uLiO1BeWzHu+I6eut33baKjw3NkYCgnASSRx9D/viPbF2yO8P+sLQAcH18E+?=
 =?us-ascii?Q?Faw40NcF/WQShg+mFa9p4Yap7C5qxgP9gFbkC2gTJA21ziY0XKDY6pidS5cH?=
 =?us-ascii?Q?0hva4Tu+Oldjf/tIe2Blb9Auo64dK2LRCZJGDnEA6eHHdOlBozOvtIBT56Ln?=
 =?us-ascii?Q?ApRjKVIaO3yViPEC4gVdOmaMw85ylOgOnJTf5JsNb71IYmhLJzKcLrd8SFbr?=
 =?us-ascii?Q?giAzB1jr73R0l8go3wmspvjxldOz/Qk4Vy0ClS3N13k03/YFEhsKgSQmRCoq?=
 =?us-ascii?Q?WVdnjShDafCi4LIs5Xj0B5gFPCWfMNh8ERZnTo4yvLIIvNRdov3hgbK4WXp0?=
 =?us-ascii?Q?0uy1EAeJPH351zWD+IkCvgsCnOYQ9/AGggQD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?X+LqjqPsqx34/iaV/wOl4eeaEMO8N94aNX2/qu8ZhdTmFJa1qLv0AujzrcVM?=
 =?us-ascii?Q?L1uhpO94EmITMJSnFrwQii57hBKbKKTDu6NQfwUYgwCINq9vcDKGdaxIzJ/g?=
 =?us-ascii?Q?0l5RraKmcVVWsGf3beq7TuqibYhbh0s6v8JwWWWrHSypb8T5V5MkYypjo8Gn?=
 =?us-ascii?Q?8dpT/u11ZExDoe+WgL0OMY6HR1I1Z91w/Nr6j0rq1XMkh5MBoMoryy6A/ufV?=
 =?us-ascii?Q?aqr6KaY6mG6iHXywMccq2hQ+z6N7By0XFfJR2Zsfug2CocWXoIvnk2alLWUu?=
 =?us-ascii?Q?pb1ZA7rUtbW9NBtGljN+4KZ0cLKlS8wzWCq4QhbEiqnF+M1WqOhBrf7dnoVI?=
 =?us-ascii?Q?6t5Sr6wsGY7Zpg6O+0YHG2PBUMFniTcumI9C+DF/G4Rft755mdWqmH/JKTyA?=
 =?us-ascii?Q?fmgEyJu94UfJp14d+3nWZ601nklne8MN0vVk8SA4ofKHQh0mSrCY5lcx+DQG?=
 =?us-ascii?Q?QQ7E1rvcyCbvKQKhvdxlUTipPm0k4worD32Hh5zf6TaoaIQj1OwF9dPkhtii?=
 =?us-ascii?Q?z4y4neOiAhtwLB3DeHrTSi57CVeANnN5UiZ+aHmwdenNqjCNW+tgsAFP3SDj?=
 =?us-ascii?Q?3c+3g/a7xwhCI0TNKoGCOZFoOIJcDTVAShXw1+olC3BdAA/kZXETleshkUq6?=
 =?us-ascii?Q?CVSegGTUnBXDMCUr9yi4sZ830CCEp9uw6PA/rIYEBMw43xCNocUF0JDFMj14?=
 =?us-ascii?Q?GWsB2rGV6kNtJUk/PgGatpYQteIi8t4F6tHOzb0XO7ponQ4s7UfRcHOn8+io?=
 =?us-ascii?Q?5RVhELFqfw2wkwPqBD14dog9XK/5I/l/OT2SOmlBOHUqR34+Wm7sGYAMV2FW?=
 =?us-ascii?Q?9MhkSCPexOmmUDsszygHwh8Q7AGkjqAaK+iGrSCxLsooBKEBmm6YDcsZhGKG?=
 =?us-ascii?Q?b9Ls1Jj+Ba+Mhqe8jHBKGbytYdPiEG2kz+NoFScLp+jzMY06PCXj58p0uA1T?=
 =?us-ascii?Q?87mr3uGr4srn0ITkSlc0g52yWlnOs297FCdwQpg+SAWe5Sa5OfWjzF9zR8EW?=
 =?us-ascii?Q?eX8VgJ917IaqOY/gosunD90z//pkJVbTt6pCVuMzL1Ng0JjRgKfIpmeYZvgr?=
 =?us-ascii?Q?26xKJo9P57sSxIqsOkBvjVktHFGFjPrICH3AMrP3ZRFX/nE7hYrOWoL08uLy?=
 =?us-ascii?Q?dQRBAvmyOP02yyetPkKp/yBWusnvSFRrrxRXc4wtmKlhgrhmBq6WFG4cYAl9?=
 =?us-ascii?Q?ZrZbm5SZ0e6ISyA0Mcuep08QJndrknKJk+9lCBarHAQewtq3+ZgVZiWvgePh?=
 =?us-ascii?Q?NUDe2as4jBR998ibly9+4k0m9rgCkjmlHLtUxexpe0yv3mUypSKMd7w7dKyV?=
 =?us-ascii?Q?XBeQ9jjilG+x7763R3bAveh33cHWUw4ivBz052Bb8iOAwhjjBBq+nj+p0cqV?=
 =?us-ascii?Q?OC0W0c9MTYIlSMFcDq29UZpxi0bKOOLHKdWqozlNj3jPjMTF8OxfAKbKl9sE?=
 =?us-ascii?Q?BZfAxSQfZa/aPcXWhcvAe1xzG4i+2MlhNGuNl3FVjrkn7AFGtxCzMxtljNo3?=
 =?us-ascii?Q?wzCMCdOlc8UvM9n39PdXK0FLL5zRFGnOoix1Zw8jeVl6xwYsUPELRu+NmHUe?=
 =?us-ascii?Q?qtqyMoxqBrra+dXGzsullEnWiehaHPfwjgSarWSZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62A03048CADC7F41B0F5C8D15B3804DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8775.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27781819-f9c4-4fba-c143-08de01f6c34d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 21:00:48.3203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0wjGrxkid9u7v3Bl9wQ0f64ehahsJ/JjRoMIFoY9eQMCdVaD53wXrc7MQqlT9YJ+cXeyzp4MIGcGsDCcZFhCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
X-Spam-Status: No, score=-7.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 02, 2025 at 01:49:39PM -0700, Dave Hansen wrote:
> On 11/9/23 17:38, Daniel Walker wrote:
> >  arch/x86/Kconfig        | 44 +----------------------------------------
> >  arch/x86/kernel/setup.c | 18 ++---------------
> >  2 files changed, 3 insertions(+), 59 deletions(-)
>=20
> It would be really nice if you managed to get this rebased on current
> upstream and sent out again. I'd certainly ack the x86 bits if the
> Kconfig issue that 0day found was fixed up.
>=20
> Also, one nit on the cover letter:
>=20
> > There are a number of people who have expressed interest in these
> > patches either by asking for them to be merge or testing them. If
> > people are so inclined please continue to request them to be merge
> > or to ask the status of the next release. It's helpful to motivate me t=
o
> > release them again and for the maintainers to see the interest
> > generated.
>=20
> The way I'd suggest going about getting this merged is to solicit
> reviews and testing from folks and then get those annotations into the
> patches. As it stands, this series has zero tags in addition to the SoB
> tags which I assume were its authors.

How does one go about soliciting reviews from your perspective ? Typically =
I
just submit it in this fashion and whoever is interested reviews it.

Daniel=

