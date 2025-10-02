Return-Path: <linuxppc-dev+bounces-12642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A9BB5784
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 23:31:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd4jx4pZVz3chy;
	Fri,  3 Oct 2025 07:31:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=173.37.142.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759440693;
	cv=pass; b=YdIJI2UWaqtSJVxCtiyzaM40p7WLVJ/ucyenX2miB+AqGoBrdpbcF0baKHqsTfuSWOFWGLzh0eCGbL4iUdCl3KXqau88DC+ChI5q4zpxP3WJI8xbT/o8kJKZGGlzzkSnQSMrnrflhiAYcCbRQ8HSp3NBuq8Z2lZy8VicTGSYnoFzH7ki0j5IRxrL85QmNwygC9PIBte9MFpI4IwqRT9n1aL0AWyS/blASktxF6zULvTGB+00nMStTcX0CXrnZs11RSprI1Kxuc59fwH7y1jKsPxG5WGzkhHI4voobjU1GpMxui6dhxdm+/1wVsXrtOZxVaJDF3wjcD/bBX3b9nnyzg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759440693; c=relaxed/relaxed;
	bh=irnWQNUaT2/00BiN/8ixg8w3gmUUj6/SZ8q8dInkuzg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lO6kqw+/prm09+chukaMGuyc3QrYbpmcQTLcWcGskvLykkMIjF/CkHYDn3NlSLPven9msq5eJXscwRXka/ptE6rKSqyUd9VGObNStpFbZX5RjXFQnEHYyPWLb+tcaOe3NdJFeeJh3IRuBOFpJOzNyQwenNWlrzPDKHUT2W9t4+xFlmEeJ2ilES4kxrvyjOM6VcCnxRZ+d+suxxbVUGChvyw2yeDC8I7yNeEmZ+3hnHsdbgB4uXsXERhyuc7RCLSImzzzkYEhhXmo04Ciq7pModXDZ7CZ6YTsDe0LTBrNbxiDGgPtesolX26NV/QbtQV/MmpSt/KBGyzbc69U4xvf4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=CzQ7pSev; dkim-atps=neutral; spf=pass (client-ip=173.37.142.90; helo=alln-iport-3.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=CzQ7pSev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.142.90; helo=alln-iport-3.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd4jw3PK3z3chJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 07:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2005; q=dns/txt;
  s=iport01; t=1759440692; x=1760650292;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=irnWQNUaT2/00BiN/8ixg8w3gmUUj6/SZ8q8dInkuzg=;
  b=CzQ7pSevgaHl03zgZtyUplXVlBB8pCn0nOgUt7tnmHGf4FnfjDPl+5bU
   f4K8Q1dtCu7CXQRcF8E3GX5OZcXTPe2klktLEFozyvMvVWOC8mhSYzAOA
   z9qVX2+bTnoLXnG7mgpKz1ckchf22upTFQSmlCweY63MDzSdeml/ima/J
   GJEgLf2K9b+xAOPJw8i4JNbUaZayH2ieTLPcuXLqIFt8F7Rtx9l5cItha
   7Aku9pBTA+SkK66+y/y3gMCc30g/VPPSRygdI8kq0atedhGZjzN0fo1Z7
   OaylTLBBblEicxVETh4us16uInFMdwIxgjWmOHzcjOkTWM9MC2MgRjKNr
   A==;
X-CSE-ConnectionGUID: 5xzWgHQCQ1GhZtik7O4S0Q==
X-CSE-MsgGUID: AN5xtPEDSbKI0e+cqpE6QQ==
X-IPAS-Result: =?us-ascii?q?A0BXBADg7d5o/4oQJK1aHgEBCxIMQCWBIwuBblIHggUSi?=
 =?us-ascii?q?GkDhSyGVYIEHQOFeoxxiy8UgWsPAQEBDQJRBAEBhQcCjEYCJjUIDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGWgEBAQECARIoPwULA?=
 =?us-ascii?q?gEIGB4QECElAgQOJ4UtJgMBAqNpAYFAAooreIE0gQHgJhiBMYhRAYVshHcnG?=
 =?us-ascii?q?4FJRIQ/PoQOARIBIYZEBIIigRaKdYU8j1BSeBwDWSwBSwo1DDNtQwOBMksFN?=
 =?us-ascii?q?2gSQHeEFIQegxZygXRXQYFLGIIOcQ8GgRUZSQICAgUCQz5agRAGHAYfEgIDA?=
 =?us-ascii?q?QICOlcNgQR0AgIEgi+BEoIqD4FvA3g9NxQbBp4YQBQcPDxlBRECHpZbAbAfC?=
 =?us-ascii?q?oQcojeDcY0TmVSZBqkWAgQCBAUCEAEBBoFqATlpcHAVgyNRGQ/VNIE0AgcLA?=
 =?us-ascii?q?QEDCZNnAQE?=
IronPort-PHdr: A9a23:LVdVbBG3acOYXlXigSpdK51GfhMY04WdBeZdwoAsh7QLdbys4NG+e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:9OPF5q8VhrTctKneOsJ1DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jBJXGDSaPiOMzf8etB0Otni9k4FvcSAmtExSwJq+HxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qiyyHjEAX9gWMtajpOs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lrLZ8n9cZOKlgX2
 vwqNDEOMTffvLqPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GNbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2bM3WjOX9PYH46tOuhgHjydyJRgFmUvqEwpWPUyWSd1ZCwYIWFJ4zSH5g9ckCwj
 0Sb73jBLz0hPv++kTfG+Wu0q7H2pHauMG4VPPjinhJwu3WXx2oOGAUOXh63rOeRjk+lR8kZL
 F4Q8yA1668o+ySWosLVVhm8pjuA+xUbQdcVS7R84wCWwa2S6AGcboQZcgN8hBUdnJZebRQh1
 0SCmJXiAjkHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:ODN69qvdleSoK580T+yelE5w7skCCoAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tLxGHdySWVxfJZnPrfKlrbamzDH49mpO
 hdmsdFeafN5DRB/KLHCUyDYqkdKbq8geCVbIXlvgpQpGhRAskKgXYae2Om+w9NNXV77PECZe
 OhD7981kGdkAMsH7yG7xc+Lo/+TvTw5eHbSC9DLSQKrCOJijSl4qP7FR+34jcyOgkk/Z4StU
 L+v0jc/KuMj9GXoyWw64bU1ftrseqk7uEGKN2Hi8ATJDmpoB2vfp5dV7qLuy1wiP2z6X4x+e
 O84SsIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5fjQnEMBM7LgpNycxqnBQ+O2U4p
 g7mV5xhKAnVC8oWx6Nv+QgYisa0XZcZ0BSytL7wUYvC7f2I4Uh3bD3tHklYqvoWhiKq7zO1I
 JVfZ3hDDE8SyLGU1nJ+mZo29CiRXI1A1OPRVUDoNWc13xMkGl+1FZw/r1Uop4szuN0d3B/3Z
 WODo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E78ef2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjste+596sLvhQ6eDC1zPdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXZ1E2gXvMqMiYEX2kPdlzOrTd2j+1f4jcLeaw9AzWMyjUIbQLQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AhE8vYmvOx0R0B4Pzz+Xbz3Bv6It4Ym/iw1fpCHb?=
 =?us-ascii?q?hJmZbVLyWFnjMw/tdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Au+z9kwxuobCwB4seX04zIjXa5tmaqI2IVVARqbg?=
 =?us-ascii?q?qgMOnFHR9eDyElBnpe7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:31:28 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 56C0D180001A3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 21:31:28 +0000 (GMT)
X-CSE-ConnectionGUID: rdKqAiqYRomyK7BgM3Vhtw==
X-CSE-MsgGUID: 30dX6JIvRrWcDkOwIsY32A==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="59617263"
Received: from mail-dm5pr08cu00405.outbound.protection.outlook.com (HELO DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.101])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 21:31:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usYSURIIOrJ0I3vLHeADTO8TPVyjVU6c+0JQNPRvResEh0lxgHgvOSJR+6V95UB+RAAv9i1Iztro7nbW4lJZWjidH6tAqG7UYVWdaAyWLHQu4edG1lqOQ6aCR10QG+C6ZvC1Ht4jWMCnUTxzm6j1m6T6W1GCb/fIEur214MJ/nlKJx4kilCaTH55/MX8FOumsYiYHu4dtmipaFebu3KqYtdrG0LbiJ52ZyQpV6bteEvteCPmnk8tLGwZYOJUPD/MRLkmdYhp+ecJJlLuKcc8e8JVQh2IAOFL2BsDRbrAqINIKWfVJIqela+hVL09yb9cMMkz2sKmNghdspDe1mgF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irnWQNUaT2/00BiN/8ixg8w3gmUUj6/SZ8q8dInkuzg=;
 b=k8wtp73PZ5Z42ZJ1LaAvoLfl4ZAPshouwsI3rd2OScZqFRMe/Xx4aA9FMImEExGbY8aMKLfnlQX1KqXaclKdTWP8xSq++hGa5bRWWpEA5ruTfY01dyb9BmsLlCFeI/m8My54v2Uc7DnhcQ/1mRSMpmjFPPbtT0KvNgfpIlg0R8gxCbPPiIYxPv7HXxLuUmHCy5TlD3J2KCZ+5U8pw+fqfWbS5NNZ1Mf2JaBnWd7f3N0VhhCfzVICJh94VgP+/glXoCIIXH1wL8GDik4A1qo2JXACFztOgqd2jdPo2D5kpspE0Gy5fRNGb5gzQIQYmIDpuLDn+RFsxF92yOyPegPy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 21:31:23 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 21:31:23 +0000
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
Date: Thu, 2 Oct 2025 21:31:23 +0000
Message-ID: <aN7vKgcUeQgCFglQ@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com>
In-Reply-To: <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: fa7a9d3f-8cf7-4515-b33d-08de01fb0910
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hJn26F+Hju4ErJM+hFrqxRazQTFjNeQIQB95jBX4qGXuqyX/z3QDQbiUMdLB?=
 =?us-ascii?Q?E0mcW+yvMB1s3OR8lrS7lf/Lg4t5n8admiYM8Uh9vum/+Enkl1tIbz1ZiIsa?=
 =?us-ascii?Q?BZE84sy7jTXEjeX3jR9IV8GvbDdyh0tbCzLgMw5OZ9b4UMtcNfRHY1QUiJxt?=
 =?us-ascii?Q?GxNpHTW4LztDnGVXIrOVGG4XCX2Dgvt4XugiOja3g3J9CIOqWeeN8CUUAwIt?=
 =?us-ascii?Q?8vY2gaDjAdW8VW6EG/EwGlsxGwESnzs6TNE+qTwxpnNbqK6NGjaEN6LtsvVk?=
 =?us-ascii?Q?ykBBMMxwUX8MznoVIr5+P+1UAsPT3GL5In7g+SDhAJpEPPmSLl8bgdIzty1t?=
 =?us-ascii?Q?+c1+6I9Re8vAHiy5Eb4qEK8A/xHd2X/DZ49bkfPLjaYv4f2ITSByymixYlea?=
 =?us-ascii?Q?imfk/g675e8L0/HlF6KZZeTZstn3BwymNmxRn8hIz/4AH8m01k/yd5213WT4?=
 =?us-ascii?Q?ivu2iUcHJCYVGk3BiCKNe2x0RCw94yOMXUAvkoC2sfORf2ikGgtdCApB7CR/?=
 =?us-ascii?Q?qdCNrgDXp7mjtye8UAvSSQzJf09ClXr4ZFp7bssoYLFKfUUi17OkOmcxb1k6?=
 =?us-ascii?Q?8iB38xTkOop5yqwqy+8MUuM1Q9nMz8pfvKN5XhkBDkCqqryJXma3TK5FF2QW?=
 =?us-ascii?Q?ZnJkfNv/BB8SnYwomZEaybgUhEkg8GzcX0SjA2Ezd1tRdJyas4XiDNwQcW1N?=
 =?us-ascii?Q?3FEil7laKHLUSzNNcwzBbX0ErV00kR1EoZv4I0Y0Yf5eK5t/mDQbjB/wsg6O?=
 =?us-ascii?Q?Pai6vFPHut/ZrRZU7zO2732uTMNFPN+pNlMR3SpdonIuYKC5O6gR9oJDu7aV?=
 =?us-ascii?Q?Cgbg/Xn1k9K+ugMoSV+By2JDq0vgcCUI/tdxKxQRykt1nDeeWbmLE61qRgIU?=
 =?us-ascii?Q?3aLrRFnY2T7TnfWfJLX26MAD8C6JrO8HcAtF56WR8V9c6M2yynaJdeIO+fH2?=
 =?us-ascii?Q?oDnxV09EUx1IciOd21Dci/sa9V0FT4OcSH+yyfrT/rsoI1a4z2yX0uje8i6E?=
 =?us-ascii?Q?8mmF7rsJoCDdUglOetIuQT0Ko27SpRmIN3Vxa5eMclPx+WzmS1f7sEBTvfwN?=
 =?us-ascii?Q?A79f3iSIpdp/RAvRugBiKncwZ9IvUX7eQuitbN2zRMD4HOXcY6AoMvCy+fUl?=
 =?us-ascii?Q?oHeiAedM21+7qIO6QQ8PiSbgTOOIuyaLf7b0txFVF14vJQIEmYlKa+ePeMyI?=
 =?us-ascii?Q?P0TYKsWUlXi14YRDQEmHro55INpnHQD7G9kOBr1roHuhCvcCQqMzDTbKbYYd?=
 =?us-ascii?Q?WOH1+aKSUGaaaHo1Fn2xUimjZdCbLSQpUchs4Q6CGv6Sg6KHzJY1AkGNUdnr?=
 =?us-ascii?Q?NLblD0LlCpBF749f5QQ5AvKnDlYFJNJhqJhz8FOhsszWY1WEx89ESBPRMYZF?=
 =?us-ascii?Q?ZlnYFYg3aMn8lnj90LdMlRptDYakurbNFkFGavNbKFv8xuzvuPYNext2RVww?=
 =?us-ascii?Q?88xH3tE66u2IVsgXss7h/Ju0QsfZr56oxaKggci0xGGsc6qiaZRC5HDv+oVp?=
 =?us-ascii?Q?QbLnzvzQtt1or9BilgMvG+YSXB52jLA6JqAQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3qR04Q9pTrsJU1T4h0xXAuWjGCz6vH2CSmSpETA0GLcag+ME5osLWTgEJPnb?=
 =?us-ascii?Q?ucE2CrHSa0r08ohqKgHm+A35ctL3umctzBY2vT2RjuYB3O4hC926wIgWQzap?=
 =?us-ascii?Q?+sNcj2bx9ngSarDLYm2qK/TpclPEsBngwqXBbrDSksUIKleaSqmKJATCfix8?=
 =?us-ascii?Q?/vXeZwlyn8E3tQ0cxpdODK22vjsRxX9VU6w3+fIs/U14KiS7iKtoH4WPt5NH?=
 =?us-ascii?Q?nK3dwKvRPwoXabqSvPTmGlETWGLNek4hno7IMYVqu4iIuWNJpjAXTzmon98X?=
 =?us-ascii?Q?A7BNdk37mLi0H2Qs6t1WVvaaFO3YWxkFfWijBiZxv5shIeD8Z/Y756oWbJED?=
 =?us-ascii?Q?NrzSb451jRmbyL4yUXn06vThoBd94KoIfdIHRaBKSvNCX5Q5C7ppr6AoyhrO?=
 =?us-ascii?Q?Zh+vs54PBsvmsRE5ctio+lY5OdQGzx0vc/55HiEWAGSFfMIjRpp+h6xlKSui?=
 =?us-ascii?Q?9UVtdkUgttam9xGVepQbAe2cuQVucEwfEJtOJwKaw2vqCP8LK5K6COnAk7Xd?=
 =?us-ascii?Q?ZRZB0Ljo0rKlfDrCmF+rmFbMMTVHAsn7tWjOGUduSluzXpefGhk8Y9wsHFvj?=
 =?us-ascii?Q?VNprrQozSt3QnpMc5OU3KiVvRFjoUNQTIzLQtgg1a8bpVHP7vu697oFODC4G?=
 =?us-ascii?Q?0zIJtaro1EKkZ5Wu/5fKyuiC8mkp7rbkxMisLKLu45Pj9SCBLa2f0dXuqm57?=
 =?us-ascii?Q?qt77p05NRnV1By+UMuH001AkVDj38Tk+fDSfV/TqYT9Z5uQPQwQD38v/T9RL?=
 =?us-ascii?Q?QkD5gnkvaINWx89I3O3I5K+2hc4atBoH8SU/RvefLE/jh+3RScI6JMtq7/l2?=
 =?us-ascii?Q?2T5L3J/BvtAsCJYJS2E5i11bJPBNytCxcPDgN3dMFRMsR08rEeYHYxmNi2wr?=
 =?us-ascii?Q?gnzgarucJ2JDj7k06CP4EN+6+6I8MfBUqilczAkGMHNHd+vkczJ7gJZiTWKl?=
 =?us-ascii?Q?uOArHX649g1Uy1LsjZZzR4w6ubRDSQxooXEpj0zCddxSg5PhpPOh/maNxvUv?=
 =?us-ascii?Q?b+wsnbEgdhSwZWpVn79Hqrm9iM7DjcUo1mtXISFwnjJPI0eC/Es1VRA5yfot?=
 =?us-ascii?Q?VWFcwIdP19GgffMHccYP3PkBvnKJYyhhJq0oQ+c9nezJ3qKk/So7Z0YozGoH?=
 =?us-ascii?Q?zf0FNdQ0kUpQvdfcLOZY4ZKd4KOLFwhogwdqKvPZ+cOOkP33J9JygARx+4zt?=
 =?us-ascii?Q?lfr5rx8zvUjhPyFLMo/A1aMqeY6UnoTjk0ZdPtO2cSerNsbhxDBM2dBSNGQL?=
 =?us-ascii?Q?Clf4zFKMqztWXi7SV8dxw46IISNRQtx+PdqGaqxNirTXspWWS8WhNDdF79+U?=
 =?us-ascii?Q?aQKpMN2T5RFbnl5PfikKf02UjYiFpSZtGqC3hfgK7ED45wD5JA8FKOJ1+zn6?=
 =?us-ascii?Q?scO8DSTNm/6u4iITsoRRGs/ZsR0fsz4lkcPAaF5cFWGvjdQbZcP/9vdZfUUO?=
 =?us-ascii?Q?OiaOzDtSOTuITl9fmTIegQ9F5XL+DholweEgI5yeBH2IuoRFPVDCXBEO/pPm?=
 =?us-ascii?Q?d6wwIIBvDw5Fkp417A0dlR5k1tmcp0lm5EBNTM4/nw7vqwF1w1XYbkJOfTqs?=
 =?us-ascii?Q?k/yHGgnre6I2y4Tp7iyZ4ZNs8mZdCnGmrAo3zjub?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A71958D6FE77CB43B330CC1650803B4B@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a9d3f-8cf7-4515-b33d-08de01fb0910
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 21:31:23.3083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiMYda1E/AOUtDJ9+YOOZret9A/IV7Y/4JNvePGjAnle1aKEb6GoZqhhGCCSrlvrbYdlT2e21FvekI8F5ewPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
X-Spam-Status: No, score=-10.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 02, 2025 at 02:10:13PM -0700, Dave Hansen wrote:
> On 10/2/25 14:00, Daniel Walker (danielwa) wrote:
> >> The way I'd suggest going about getting this merged is to solicit
> >> reviews and testing from folks and then get those annotations into the
> >> patches. As it stands, this series has zero tags in addition to the So=
B
> >> tags which I assume were its authors.
> > How does one go about soliciting reviews from your perspective ? Typica=
lly I
> > just submit it in this fashion and whoever is interested reviews it.
>=20
> First, figure out who should ideally review it. Find the maintainers,
> find who's been sending patches and reviewing in the area lately. Use
> get_maintainer.pl.
>=20
> Then, ask nicely. :)
>=20
> 	"Hey x86 maintainers, I've got this series with a pretty nice =09
> 	diffstat in arch/x86. Any chance you could take a look and give
> 	an ack if you like what you see?"
>=20
> You can do that in private mails, or in a separate thread, or in a reply
> to the original series. Or, go hunt folks down on IRC.
>=20
> Just tossing the series over the wall and giving it thoughts and prayers
> usually isn't the most effective route.

I've always figured people wouldn't appreciate private emails. I guess I ca=
n try
it tho.

> BTW, your series looks like a *really* good idea. Please don't let it
> die. But you might want to trim it down a bit. I'd probably remove the
> tests and the 'insert-sys-cert' changes to make it more approachable to
> folks.

Since x86 is asking for it I think it would trim it down to just what is ne=
eded
for x86. If I don't trim down the architectures it ropes in too many people
anyway.

The biggest issue is that libstub would need to be modified, but I've never=
 had any
luck getting the libstub maintainer to review anything. I suspect he would
ignore private email too, particularly from people he's doesn't know.

I'll try re-submitting it in the manner your suggesting.

Daniel

