Return-Path: <linuxppc-dev+bounces-12647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695EBB59EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 01:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd7YV6B9mz3clB;
	Fri,  3 Oct 2025 09:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=173.37.142.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759448366;
	cv=pass; b=YnP3DRPji5GGRa658lLp6DhokDzpNRz5TAwWQn17XZTyPXCdD5iOds7HpsIlnWkhlairH7KkZvc4zsfImFrX4bNvhCEfPzHVm60yIPFQOXmoBfF+ED6EfUA0ohCEVYuqwajWwjM9Ia/fe73TXljruxpxQazOeGFg+gAR8dIefDKWFBp5wi9wyB0/sFapacIQMQz8XvT5LYnOYMM52Lx0TF94hb/SxZd4BVj+jXrkMyAyALjz+gg8vfsS8hk4sx+zGuwLx5HNM600m0DDLbQLJjyY+NCYn46wNIFVjBMnmRC0ZJgB/TTCYCrJQ4vMQDXL121b+qPpDTTqrov0ZJLhrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759448366; c=relaxed/relaxed;
	bh=tCNxOvSZ7dfQx83Z+gpSwBDza+z/Dj56WuMUJqqOias=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aLDkDuiDSpTGm3/BE/XLHq9W2xXn1M0ULTVDrU1MLA1LZKrU1Xcn4UrzpEN8rXjqi+5aBrCS25Ez4AozYmcE7nUs458VDXxnX/jZilEYFN3IcOquerOmmFyZA15LXfK/wCSfOFhbLoQirRUYOPMJBEkBYUgAgOzimt0k3Y2meTT0q+1Vs27RbdsXRQp0xDppXjV+iZI0ggUMjKljH/xF1PSEPKgV+LiR/zwXI6qK6rPEs62QmY1IEs8egqPB+XzTYOh4AfIdF3Mz24sd15ApejX3c3G90Uckt2bym1U5v7xDhwvd3K2DBoNzLL6QIaJG8ilCcaCR1loXVnsfjrniAw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=Y/XQvVv8; dkim-atps=neutral; spf=pass (client-ip=173.37.142.90; helo=alln-iport-3.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=Y/XQvVv8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.142.90; helo=alln-iport-3.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd7YT1Rnkz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 09:39:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2363; q=dns/txt;
  s=iport01; t=1759448365; x=1760657965;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tCNxOvSZ7dfQx83Z+gpSwBDza+z/Dj56WuMUJqqOias=;
  b=Y/XQvVv8EC2hJuTweaMKHWocYt95SvUm+4PMNp0h2c3Qxg2Ganl0+4dO
   WXwMDNtka0DEbqLB93gGlUlmp3AW56bv7XZbD+3O2ZSKBwk1gkFQ3joi4
   CRKWRLjgJ+WpLsU0TJ6sEeBh8+haxpHA1hZEEi0LEoqGpP/tgyBqws3WZ
   FCs0Lft8Y5iTV7oSgrWJt3e5cvNzPBrY7v2AZGKZ2JFr2UoBWpX9RqrTK
   Abq9TRpZ8ijQqELc2BeH+ofjQqYPQ/wipGz9m7VPSlEuUeJSvXxVLCVcr
   PDNU0aHmENCUprO9+7jVlMYl4HdfW5VycaeMcZfukrfgF+b9aeTnSn3Gk
   w==;
X-CSE-ConnectionGUID: ok8zPM0ORuyJNYaO02mNaQ==
X-CSE-MsgGUID: TN2tWmftRhCh99Yt4k/Tcg==
X-IPAS-Result: =?us-ascii?q?A0AtAABcDN9o/5QQJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEaBwEBCwGBbVIHggUSSYggA4RNX4ZVggQdA4V6jHGLLxSBaw8BAQENAlEEA?=
 =?us-ascii?q?QGFBwKMRgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZaAQEBAQIBEig/BQsCAQgSBh4QECEXDgIEDgUihS0mAwECpAABgUACi?=
 =?us-ascii?q?it4gTSBAeAmGIExAYhQAYVshHcnG4FJRIM9gQI+hA4BEgEhhkQEgiKBFop1h?=
 =?us-ascii?q?TyPU1J4HANZLAFLCjUMM21DA4EySwU3aBJAd4QUhB6DFnKBdFdBgUsYgg5xD?=
 =?us-ascii?q?waBFRlJAgICBQJDPlqBEAYcBh8SAgMBAgI6Vw2BBHQCAgSCL4ESgioPgXEDe?=
 =?us-ascii?q?D03FBsGmWeEBm0UHIFdBw+WewGaBIEElRcKhByiN4NxjROZVJkGpAiFDgIEA?=
 =?us-ascii?q?gQFAhABAQaBaDxpcHAVgyJSGQ/VSXg8AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:fhsTMRKWqI3tV8ZvV9mcuVQyDhhOgF28FgcR7pxijKpBbeH4uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:nAhtxqL+QNYEGYeQFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENSgzEOz
 jdLWmCAPfaIN2D1e4twOouzoB4HupDSmNIwSFQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL8g2Yuajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1pDxEkBahA3dxqEENox
 PU/cGoISBm60rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzPHwsYDUXUrsTIJ43mualgmb2WzZZs1mS46Ew5gA/ySQsgOe8a4eFI4XiqcN9omDCu
 l3D8XjDAjoaZY2u1WaGtU6nibqa9c/8cMdIfFGizdZugVuO1nQLA1gaWEWTpfiillX4XMBbI
 kYPvC00osAPGFeDR935WVi85XWDpBNZAoMWGOwh4wbLwa3Ri+qEOlU5ovd6QIVOnOc9RCch0
 RmCmNaBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:c3CZBaB6+9hy8JflHejQsseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXbsibNhc4tKLzOWyVdAS7sSrLcKogeQVBEWmdQtr5
 uIH5IObOEYSGIK8voSgzPIU+rIouP3jZxA7N22pxwCPGMaDp2IrT0JdjpzeXcGPTWucKBJb6
 Z0kfA33wZIF05nCfhTL0N1LNTrlpngrr6jSxgAABIs9QmJih2VyJOSKXKl9yZbeQlihZM5/0
 b4syGR3MieWveApSP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CClCpdmpDs1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6jh2f5q8CRfkN+NyMBv/McTvLq0TtngDhO6t
 MT44tfjesOMfr0plW72zEPbWAwqqP7mwt5rQdZtQ0ubWJXUs4ikWVYxjIXLH/FdxiKtLzO14
 JVfZzhzecTflWAY3/DuG5zhNSqQ3QoBx+DBlMPo8qPzlFt7TpEJmYjtYQid007hdkAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiTcg8Sj7wgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3f071E8WB0JBC7xiISmSgWjbmzN1Y+vFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTGPPnJXuGI/cB4+Q/YeglFZAzarxjhj9gYSP6niviEPyfitDm
X-Talos-CUID: 9a23:549BJGPCTlc75O5DXyo35nYxQucfb2z/6kbZBBfiDEBgcejA
X-Talos-MUID: 9a23:a9qL9warCkSIEeBTixm2mA5nOttS44+uWRE8jckF/PWPOnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 23:39:20 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 4210318000395
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 23:39:20 +0000 (GMT)
X-CSE-ConnectionGUID: oeELfB4NQm2azP0xtbvtCQ==
X-CSE-MsgGUID: TnA9KwhLR1K8tmcJZhQQTw==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="34141129"
Received: from mail-ph0pr07cu00605.outbound.protection.outlook.com (HELO PH0PR07CU006.outbound.protection.outlook.com) ([40.93.23.93])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Oct 2025 23:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOnszKHN8wuCt4FpOu32VkLnhXNPGHZlzslC7u01iZxW4fmumDPGJe2EYJOus5UjBlaqPK18HQUq7R9rAPjZf3GoNmBE4nBu4WnnWicEjK4LyJNm+NXKDh27/ej1R6ztcANHn0olN3kCd+CVt+Jocx/rlEOrAlAcbl7hBAVwHH/wkHEpGxuS07dRAvY+Sha9mDGZUNCBIXSqBSIwuMXfjELJbmYLIt/iE0m3t6Z3VYxpdcQ2eHVsx42BaKcsMkJbFY5dQtZLcZ15nlfCmja7gDWhKNARazCNm/7dbapI+JaAHJXjuI5bwDm6PVlAJxqoGWToaiFskjDPJpqS6ietJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCNxOvSZ7dfQx83Z+gpSwBDza+z/Dj56WuMUJqqOias=;
 b=cE8pEPGwv+XgxgiHCi9ocgmv3cfpkawgTztM/ftS1xfmg6+oGKSsS7EI5fm2aZOtb+8b/IM1jNdD5LPITS3f5PyK35hhKCpXsrI9Qc99vkgNHEQpv6XAaU5Ff4jd3amBjd086SGcL1qPpXlDY3FrF3rDnOvf6ITU+ObRsB628I7aW0EAfAZ7rDxFbsOCI4xtGoeZYm2pdOaS7z4+X3uY5WUyAfR4dZ7eDpPfTqjDQV0D9Zezaj7fvqQbNrm6Wi8FXQStY8kGoLFxFCWtpeUR9r0tFS601bryKBlUwAvQoxFlVxw4xnsrgntLmQqROSlRFcVbVitrlgyFRIZHAGfTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 2 Oct
 2025 23:39:11 +0000
Received: from CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da]) by CH3PR11MB8775.namprd11.prod.outlook.com
 ([fe80::d17a:fdd6:dfc9:19da%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 23:39:10 +0000
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
Date: Thu, 2 Oct 2025 23:39:10 +0000
Message-ID: <aN8NHojvtyKbX2Cs@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
In-Reply-To: <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8775:EE_|LV8PR11MB8558:EE_
x-ms-office365-filtering-correlation-id: d0b12058-140a-4f4f-bd8c-08de020ce33a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hF/4q6+ByMNrTTxKxFb1mUE0c5Nt0hF20vePRbOO4EJJ/UA9/6UdQyR8v7NN?=
 =?us-ascii?Q?IMguo8BmmY3HdI++M/ngSmnzHdAYPHp8CCd/mP0LD0cg5tZcy0q2ZTNJDUO9?=
 =?us-ascii?Q?IfxAQvP3yyB5VQq08DND6uDE5qlQvJFz/Wystg4J9yG5c/b61ZTtQZo+TqbF?=
 =?us-ascii?Q?AhMC191dc5dP2RW4aXgw22FoqO9L1MmWWINRtuuemYQQUZiFoB60LuesKd9b?=
 =?us-ascii?Q?r3WqGtMgvAWOe/6ZKAG9zLsVYjAHxzxOU9t38QiTFJnzAPI4g+74Z50+aiou?=
 =?us-ascii?Q?ECYf84o59zX0yBYm/N0SVIny5FjWjKMdGn0D62tWboGz+9KBYPTxW+nC1n0q?=
 =?us-ascii?Q?5mBkfTxxZ1CF6R09F/Yp7Y2BS2C4YSejWWnNz00ZJMygj97+2J2/Iwo9oAQT?=
 =?us-ascii?Q?IEp3wIxBRdZC3NudGEC1DKojOR002u3s7O0zpxHobTDHa+sWDNGcKTyTukKK?=
 =?us-ascii?Q?eWH/VgWSfGkMiZ07InPLP02Q+nSy/RzMLw1zcsFrnpj1GRsW7+UO0G1ZybiO?=
 =?us-ascii?Q?YNs32rYCDLXOemxJk4GuOSJ528G30VO6AtG0uc/5nu4+d91016DwRiPz9H8k?=
 =?us-ascii?Q?V5vIe856RmQdsF5SHFiglF+I02wHaobe87HplAoExxn3Xj+WHhSP3X6X6GU7?=
 =?us-ascii?Q?aJ7Yjb3eCCvP7MAqyHK0z4kXENfU/JowlRFg5RcFoTm931mGKt+wdnDk5TCG?=
 =?us-ascii?Q?VYXhGbYWp0DnwzIx2BbJjFTp1utEPZTAvSORaFdPdPbi+nV6RtNnO2oghwM9?=
 =?us-ascii?Q?DP6G72nXI5aG5OpM8MI0jGh67Tom125GW2JfU65t1NWbLFrXtFwwaYO0YV88?=
 =?us-ascii?Q?EBZMD8OliGnzt949/mN4dcclWo2kSKrpPJ2IkDava18+ADkRuu/ff0V5ESEt?=
 =?us-ascii?Q?RIoZCUy9DWISLzxil4chRcKtKOxmH4G+MU8FPlpWYNYUKk6MVLXQV+7DesPV?=
 =?us-ascii?Q?Ynxfqx4EdtMq4vpd5Kd26ixMsAyJ3c76QYzkHJZMabz6z5Y9bmpv9YOir0CL?=
 =?us-ascii?Q?nGkjX3urk0A6SeUv7C+VprkKuKQ0Vv5IdW4rkfJZJjhUut+Ol9Ub/Kivj9qA?=
 =?us-ascii?Q?uzNtDlKmZkWojLpfsAhJxx8RJsjYXplMNld5LgQ/PFIXjc3AGjqbpbWEostw?=
 =?us-ascii?Q?i2ID2gjEOsbUtPaqZA70+O75BqZCZ8oacjELcTIzatZsp+XCCYq9JjgBqtUf?=
 =?us-ascii?Q?X0y0yHjSCnppSwp5tgZ+IVerMAWkbprtV+9SnpU/FHSKaVygOElzg6OsrVgu?=
 =?us-ascii?Q?2qbNucGWQ3ZvMayQAY2xZlszNH0OC/g+RFyComTX6H0QRwhNtIZhDgYyKzrw?=
 =?us-ascii?Q?nFm9ygamaybwB0idvqgcsD25jjSkL7t3Fl2lXSV3iDEDNAFTSLJWoU6pZcbE?=
 =?us-ascii?Q?XZ8zvIbSrZQbGbWVRGXn0hTnIcvEELXcbNv6M2Mllx5hSDvgtKRQk2Nx0L4h?=
 =?us-ascii?Q?tOPJlWfgldI5iUuBCHlzX9NlDrorDtjKUJn7AZmkUTaeK08JjnKrKS94vWJ7?=
 =?us-ascii?Q?FhFFA1JWCRo0fWEMwOmdTCxT1FGAILXqvcyK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8775.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bHFduCmD4VBIy4peR5HTyCYadvG61/LEqZd/bO0R6FFFB1Nq/td2IS72IzAO?=
 =?us-ascii?Q?9Bx3H2eFjDazVPNwWgtAImhAWX94wy0cxsga3JaP001ZblsXRFkBxBgNvTGk?=
 =?us-ascii?Q?VJPDWrvJoivYxgaErhDXlNyh2myHdJ67DalaUow8RfmbTdmCDrBv9p1pLWci?=
 =?us-ascii?Q?RNETNgyetUde7L7RdGmz02BtVsPdsPjZk0Tfsb6gH1fhb3K+GrfiZUQjjQ+O?=
 =?us-ascii?Q?NrS5rb0o7g+9oBan06/R79dOBemGefEvme6Sike3nDvyIUDwqp2u4U5bTB+L?=
 =?us-ascii?Q?Zx4OW7QJ1/NUoio0d8Mc7XAf5ZLf79q6CbD7CEG7WwJ8A56UU1ugLKcIgRUw?=
 =?us-ascii?Q?zaF2g24Rl7TPw+FSbm9RsRKUIbcTavHY6ETgMD3DT30KMT+/CCnxbNc/B73n?=
 =?us-ascii?Q?h3CCiujta5bdm1eT1rVGVT++r/83HoJKgfI2vmWJdJTP8taO/xvW4LXnEZV6?=
 =?us-ascii?Q?c2UKO5eF24rzKmtDQjozYriWEuEYt77iPNo1UZEnOhD/BKzJhIU9em3Ds1Ab?=
 =?us-ascii?Q?0DStWGZa373HI7qwLqBa5eFAISX69vsrNfSLyQIE97Gn/x3DV2YzZTkXyQIo?=
 =?us-ascii?Q?2QPHHBGvv0ZZVtJ8VRgX3FSWBmY5UaD0yvqXRBIrjzrKzO0aMZOKAG8m61yC?=
 =?us-ascii?Q?6+evMz4ldu4v77N3q7i/seOD2k7e8oi7iB7ZDpcPVFYDJ0HOQXeEC5u4GkBt?=
 =?us-ascii?Q?4MBXuEQkUVUF1jnYnP5HdNEYQ9fMKh/aRyHYQm+PfhSKjsORJhVUBP9ciFBq?=
 =?us-ascii?Q?F/JefGebn5MJtJc+J4I+LNGg4D4f7Po/9NeMLDFhtRo0xh8Mr06DT5Oa3Tw4?=
 =?us-ascii?Q?eMpUkvxgVRjOsLftsgz6bqLdX0xYlYltbSKlG6rAhml+tSTFWOU2IKORusrv?=
 =?us-ascii?Q?aFm3nCcgJdol+pSH6FKAvo0N8BU300iEWCVtCswADgUPx7a/9PLphvOJD9sM?=
 =?us-ascii?Q?80Su9CcTvV00W0SBQmce5N/3D12ubqe69LGUeMq1D+DI1M9byczEKjZDtgSL?=
 =?us-ascii?Q?KvJ/PilSYnBPQFvBUREGT2WJre64fBaH4skqG6NLJi5jvvvjJVUSy1NjL20J?=
 =?us-ascii?Q?999Ga9uymkHjY6tAaPPVxjapk2VzHCuc5osGdDewy6Tm5jhD7CIFfNQ8Ixsi?=
 =?us-ascii?Q?Q4pYLPXqP8NnKEZvZgiU0yiZWFqBDR9+1Yi83lrayIIT35bBet7b3tjnN9yN?=
 =?us-ascii?Q?Pe8kDW2DA5Qm9xvpK8Wnq0HqKbi0JLcKqyMxbOIO1t2V/Hl7G8zAPcUtAYyK?=
 =?us-ascii?Q?4hhXzNpeAzbxO5uePLVnO0Z1IU+KSCtHFZQJjadNviBZxe6ljY/934JkrEL5?=
 =?us-ascii?Q?/NWEbtQaGFBfWpSAV9VxLjBDrhMOIkL3bouHnQn1g/rYGtwSAKKy+xTtmASE?=
 =?us-ascii?Q?yRDH5XjZMsDVgwtwd/hBLwacnsCyLCv3ZXNWOVLVA8GrWxltEaYsgkbMgqOh?=
 =?us-ascii?Q?JFBDdgiK1TfR6bGJb/adCKvS/tKnzEGUj6fyGGwXLC6QgtfJ1/jY36JZ+hGH?=
 =?us-ascii?Q?IhHOKnGmio+BBGWZN0etNJXr1t86mtekSoHyiimHNjOVx5LP5XPGg3UebSjH?=
 =?us-ascii?Q?LqC0lKlHWMFbbK0AiUAGs/DUL3mUUGCx/1N2vFcz?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A6D032159117184693A583B4BBD3F49E@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b12058-140a-4f4f-bd8c-08de020ce33a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 23:39:10.8193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Kit0FMno4g4j7A2t6BVCbXVc8M3BDrN0Y3KQpoDwxCSlwONQdE6XB3yQW9LaV2H/FFmNZuGhTYk2FqnfGILag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
X-Spam-Status: No, score=-10.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 02, 2025 at 02:55:07PM -0700, Dave Hansen wrote:
> On 10/2/25 14:31, Daniel Walker (danielwa) wrote:
> ...
> >> BTW, your series looks like a *really* good idea. Please don't let it
> >> die. But you might want to trim it down a bit. I'd probably remove the
> >> tests and the 'insert-sys-cert' changes to make it more approachable t=
o
> >> folks.
> >=20
> > Since x86 is asking for it I think it would trim it down to just
> > what is needed for x86. If I don't trim down the architectures it
> > ropes in too many people anyway.
>=20
> That's not a bad idea. Or, even if you can pick two amenable
> architectures to start with it will make it really obvious that this is
> useful. Two architectures means a *lot*, IMNHO. Two is a billion times
> better than one.

ARM64 has also request this series in the past, but I don't know what their
current code looks like since my last submissions.

> > The biggest issue is that libstub would need to be modified, but
> > I've never had any luck getting the libstub maintainer to review
> > anything. I suspect he would ignore private email too, particularly
> > from people he's doesn't know.
>=20
> Are you talking about Ard?
>=20
> 	EXTENSIBLE FIRMWARE INTERFACE (EFI)
> 	M:      Ard Biesheuvel <ardb@kernel.org>
> 	L:      linux-efi@vger.kernel.org
> 	S:      Maintained
> 	...
> 	F:      drivers/firmware/efi/
> 	F:      include/linux/efi*.h

Yes I think so.

> He's a pretty nice guy and has been active in this thread, so I'm kinda
> surprised to hear you're having a hard time there. I'd just try asking
> nicely. I'm pretty sure he's "ardb" on the usual IRC networks. IRC is a
> great alternative when you're having problems getting your emails seen
> in the normal email flood.

That was the first response from him over many submissions. Which channels =
are
popular on IRC ?

> BTW, reading the changelog for libstub, it wasn't clear to me that
> changes there were _required_ for the series to go forward. For
> instance, is the x86 patch useful without libstub changes?

I think it is required because x86 can be compiled with libstub and the=20
changes take effect for the whole kernel when compiled for that architectur=
e.
libstub uses the Kconfig options directly which I modify in the series, so =
there
would need to be some compatibility changes.

Daniel=

