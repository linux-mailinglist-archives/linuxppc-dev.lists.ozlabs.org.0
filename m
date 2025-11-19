Return-Path: <linuxppc-dev+bounces-14340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F6C6DD1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 10:49:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBGsw4Tqvz3brL;
	Wed, 19 Nov 2025 20:49:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=185.183.31.45 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763539096;
	cv=pass; b=TB0VIdk3ritxv3BcVCPhia1S9iHIxRP0K/06kMbps4LgIDvxlGiHEivpyvMy7cpsHUSWpxBzLc/SU2usmcor4lkqjFlkYPbrEWW4uZIxZypGgqVO9oyPtoA0uBFc4/Z3RiVx12qIPDCoQvjcJ/n++4HQpX7p8qi09By6lBImJxcceZi4+0xDlZ4/Chxn3dnlW4dB+2u5P209bYKI1pdrk0aTlKFhwoQUxchow3YQJk5t2pCXu/yj1tcqQR4M96fJnLKbGjFYq49G77gc5FZlQBMTOTy6zIsq5JqxXTqnPMVZOwO7FzL8XPlYusv+fVxOvVCdOEbLYNr+2XbjWiUHwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763539096; c=relaxed/relaxed;
	bh=Gm4h9noqeh+P+YXV6FRFso2mxU1SH/9VG6o9/W+MH+Y=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kt9e2MOgwLqrxeWE4Gexx7L3F9dHlDIzNlpwGi87y7fYOS41jck8oE5CxuOCFZwD4PpwsCW7vnmIsOYvlENTuVWVKgbBV4iRUAAfrchIhOAlCJm5fch6UbBt3NL6NvgX8GjbnSc2K/vI8NNJoy52dGdNbaOwQTVROWO+fO3KtnbfwMqaPjASdRI0Ik26cdoIl4OD0obcikMysteL+xo115niyX1yc4CxV3yrOM7533JLKJDnUDFmedVsoHjzFzv+Ih0hgA4dZb9pyy+nusgOsIhB50RkNPp3pjXXD3TBOjwhlA2Yk/maB03ckHAZnmd/5miVTLANwgcCAPHu1Bw+ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; dkim=pass (2048-bit key; secure) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=RFmfRHkb; dkim=pass (1024-bit key; unprotected) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=tf9tPw9J; dkim-atps=neutral; spf=pass (client-ip=185.183.31.45; helo=mx08-0057a101.pphosted.com; envelope-from=christian.melki@westermo.com; receiver=lists.ozlabs.org) smtp.mailfrom=westermo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=RFmfRHkb;
	dkim=pass (1024-bit key; unprotected) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=tf9tPw9J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=westermo.com (client-ip=185.183.31.45; helo=mx08-0057a101.pphosted.com; envelope-from=christian.melki@westermo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1113 seconds by postgrey-1.37 at boromir; Wed, 19 Nov 2025 18:58:14 AEDT
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBDPL3S8Qz30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 18:58:13 +1100 (AEDT)
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5Vo8P3743590
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 08:39:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=Gm4h9noqeh+P+YXV6FRFso
	2mxU1SH/9VG6o9/W+MH+Y=; b=RFmfRHkbO3myIWUymrHpORFuZV3Qmsvpp4d+Ab
	lcdE+Z+UMBW4u3/slCwvL+CeC9DB8F2FSoWg3pNy0m2sn+8f6JT374QPmphLtGEo
	9n3svvOlvcrN4vjBZryFfI8a38EFjghchKmddNUKb0BjM/w7fqBJnppqOnnQE59e
	zh3k4yYtdmLhu3tUEAOHt4ttMmXILFkdOBBwgCByAb7qhPElFNVxDfup3brlK65i
	QtFfdPXiPVQYdkFf4VHxkOs9bRD8DTrp+hCp8SxsesOXYmqYLOlcxDR865W98aOb
	dti7PCjhmzzHy2nktQlYaHZ7/Pk9ZJS87djma/i8jspAtgyA==
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11023077.outbound.protection.outlook.com [40.107.162.77])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4aeed53p5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 08:39:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmArOxgzhZRTpHDC80mfgOZ5rzbx66IDRj2B0bvQHBydYwnQEKuBpOcKX5QzFoNOt7ejnpfttB7lLsOpbs6ll2o2j05vZ6Nz/k8reLPEAIm4NmTZYtLpde673dbtnvJQbdRqUHsCdPbFPbix8bJC99L6duxf0KYyCgV58gX2kBS/hTNZw5+l4M1TXyVUuKzpBh29bkwmgmOcn8bPMudlpkBLqjuoiSv5ZC2b+0nIL9v1W4qTfIVODtIacpXwws4C5w7hNnQk9/vNnZjnU25WRqLlgXyW8XvQTrBhXBzz/mUZM+lzB1clfdt7728rfM8viRyv4T4HiPvAgYhuda5FDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm4h9noqeh+P+YXV6FRFso2mxU1SH/9VG6o9/W+MH+Y=;
 b=huTWvT51deBpWeNb80Jz75p39S4j/fs6pbjwIfbEGg9a5ay8TRIaIpiH5UU5z5Yi1i7xHDmPhCaOxQIm1NFO5ZkHb5rT+/9yYiRV2FIPsBVe1eaMtUrYQOcLWWdEpj2VJ5vo4sPU+cnfqHMv4WWvb1hpaWvZhvsWTKG1Dmh7OKV8loCzy4PCCXdHz5yghTHLJjzJQqXDKLK2/LZVnUzpINe+GdXWPxGbOAgbRXlWy00bY/PvoV/3l1DOqDOR1UzNRib3UE3aS2IHEZMpMLFkQBRwW3wvP7w24aIzK8jnkiKK0KMpl1rpHi+R5TGhX1YexLydIlYNmCbUAXCL8+c3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm4h9noqeh+P+YXV6FRFso2mxU1SH/9VG6o9/W+MH+Y=;
 b=tf9tPw9JiVEA4oqQ+rmxpRoWgcQdLk4QhA/qO1Wh2G0dDEFOhA9dcbpwiIhoxlTpEHsLD+Rxpl5Zn8w7p4NzxiQOQDGjcD0ZVuXAZSeHxsrgLaP+JFLelrlh375O1ElTAg0GxF0bjAETeaHr692tOUKDiYhNwPm7WsJgIY4ZRto=
Received: from PA3P192MB2865.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4b6::23)
 by GV2P192MB1968.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:38:48 +0000
Received: from PA3P192MB2865.EURP192.PROD.OUTLOOK.COM
 ([fe80::5cba:44ed:ac19:62e6]) by PA3P192MB2865.EURP192.PROD.OUTLOOK.COM
 ([fe80::5cba:44ed:ac19:62e6%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:38:48 +0000
From: Christian Melki <christian.melki@westermo.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: PPC code-patching calls tlb flush with irqs disabled?
Thread-Topic: PPC code-patching calls tlb flush with irqs disabled?
Thread-Index: AQHcWSI7ad3jUX0IhkO3wntod8Sa6g==
Date: Wed, 19 Nov 2025 07:38:48 +0000
Message-ID:
 <PA3P192MB2865C07D634E3B775D003C7F8CD7A@PA3P192MB2865.EURP192.PROD.OUTLOOK.COM>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P192MB2865:EE_|GV2P192MB1968:EE_
x-ms-office365-filtering-correlation-id: 614daa50-0559-403f-871e-08de273ead6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sLzd1YuWWUOQnUgTccB9Vf3W/l5q8DQjWFEGPRW9ruQV1hIr6GGCcNm28+?=
 =?iso-8859-1?Q?vGKdky015llULJfC92Yndf0Lo/FdAgn2slhpNlr1Z0FX12se7ofPCC7wed?=
 =?iso-8859-1?Q?WIoDloQN7AnpWasDc/5ui8l9kHFa92LNtQq2u9wlVFVQ/7GHgu6V6dS7VY?=
 =?iso-8859-1?Q?XEde4DbRzfmC85WWpC2kVKv1H4rOhqPr6PCpkqy1xsp8JwUsjbGRnmOOvR?=
 =?iso-8859-1?Q?k4WW1P+MIZFTiUI/+ZKDefgm1TG0g/uEttZgpHXLKf6+Uhg4DWgHS0eX2o?=
 =?iso-8859-1?Q?R9x7aX0MscPkjQLUOiFt66cvBHwunLqRvT9KoV1Bpty99PC+dzXzkHN+PE?=
 =?iso-8859-1?Q?PoWnpa78LIbHeSGGzZd6DVPJ++T2h75SrBKa9RDs6NmUWJYQyOxaREAT2J?=
 =?iso-8859-1?Q?jqpJRLp3d4aY4YB/0T70DF7oQUL3cwdnZC6hTFbsrsNGb2Xl5KiNB3Gm4G?=
 =?iso-8859-1?Q?FKZ/0WkObvZROFu7c/WKcVYeMEGHY8MGHxNo3hBNbKUsTTKaP7qju9ofmi?=
 =?iso-8859-1?Q?txsRsHl6eRE7u+pH8C+KRW2BlPGExmS5pv+RYArRhbIKr37P289lxYnRWb?=
 =?iso-8859-1?Q?ieZzNLbSZcUZOYwKLnbU6DblMYMUo7R6Vj9MtHktAlvmGLZI9pNTZSbiBu?=
 =?iso-8859-1?Q?jXwXNv7qEsDJZCj4kMZVXUMCEbkFvQzD4rU1HAiyi4z/CD3H2QiulYHmSy?=
 =?iso-8859-1?Q?y+yb2Dl/926rCOrCnT3L3zKEjZuHO32wdRmmiAXiHHsLgaHGuOJhJquVlE?=
 =?iso-8859-1?Q?h+LZOWztP5WEqzkzICxbhi4xVszTB7B+pchGy+knor8RyRGzixwkh00u9U?=
 =?iso-8859-1?Q?wJ4Y9ttJLwubHL61RD7bnMLj415ucN6BM5a4/1BMkiG7gbUfGrUWoy0Yfz?=
 =?iso-8859-1?Q?EETVZqziIbhHMF7P4yEPlBHMd564QYedW9nBtYyeNwi3YL8vAlXxEHHfzX?=
 =?iso-8859-1?Q?cby+oQIK3bDTIfgoaI8fq1iH94YNTrzhXk5FLAieA5eqW4G4TWSyjhCz9U?=
 =?iso-8859-1?Q?Oa0yZokS4EGxzTeI6zT5LB8nqFGsMeimaW8y3Ke0z9NLn3PBooyWa8XJeH?=
 =?iso-8859-1?Q?/s/mwg/tPxI/nxkPiCByR6oPUxj+eo/jSaDZpsoHo6CyK3ERuQaQsqSFjW?=
 =?iso-8859-1?Q?3/wj4GCZ0fxVlDtHIySlyzla3OgkYxLFS21+kVUIC6ARw5K9H2V5mmsxVg?=
 =?iso-8859-1?Q?8LrQ3t7BuJ3RNcDClLHC+wNk1rNeXXS+fHpVXy1+hLfK786vsoXfV1M7Zr?=
 =?iso-8859-1?Q?Qht1/iRsD5QoSRAgwPDW2bdciFKoQ7T6S+K0+A8W5Ea51wUx8iMpZwPl1o?=
 =?iso-8859-1?Q?DvQEILfckFk37zmm33qyyLkZdVt3gHibzvi8lxm92L6Zkjyp5QXkX1qvTi?=
 =?iso-8859-1?Q?w4n6iopvc5jPa27W2ob7PNJUB6zAEf+qZwc5450XmTowJIbcFvviLC7TQP?=
 =?iso-8859-1?Q?darV0GtpJONPpqlru4Gi/fcjskaS2NRMtttAivvEea1bQpN6CudfbZfyO9?=
 =?iso-8859-1?Q?KqkliYE5mplAbhBzGg4Rj/xihWFFkA5wRrVrBnRH5KohRyNSOva0XtGNDP?=
 =?iso-8859-1?Q?YjdX2/flGU4zEhD2RuTuMLQQ2Kiw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P192MB2865.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?a1PrG7sXvbz6yM5cydmaiK2Y66t7lJTQS3T0vzm691vsxpoZWKppPggjlt?=
 =?iso-8859-1?Q?jq6TCZYT0FTWdGpyshRwpTcsp6QHiNLnmwl32E/xab86RFa7X2KFEmcFgW?=
 =?iso-8859-1?Q?+4ZLCA6TcMMrgtpAEA7WcCjsIjJNqD54r6gMmQ4NSmLsCJXUMlW0j67uo5?=
 =?iso-8859-1?Q?DMD8b0Vf0M/U6/NHyV0PdDcqIKtYJrZVtJgj22gdIU5aeWPXl3baSUJKKP?=
 =?iso-8859-1?Q?zW97Zngy6MVORlkm8U2Rm6YiMkIlYFRWW1hDs1FSL/LKNaBGQbWlIbrA9V?=
 =?iso-8859-1?Q?KolUFaEEOY572usxoB5egAet83f+9Wvhi5sw9dvr71ooTI/NhNV2pUWj/t?=
 =?iso-8859-1?Q?EXoFCrJ2I35+ZAfoOG7LzBrcytGJY4ql6wE4gqFWMKLI0enY/K1ehOSNz5?=
 =?iso-8859-1?Q?tylsGFq09CJDv2/57HqjdMa3VhIsv8ko4p49X21ozi3sUqH+5UN+NZNjiS?=
 =?iso-8859-1?Q?jeYf/s7P2t9e5XJqeZ9ULmMxs8CyclMvADXU4R/rKRk6k72B7vekVg2sjO?=
 =?iso-8859-1?Q?2tMuXHjNIQ29OVEFR+SOZCZoMZJ/6iH4/f+o0DXGOELr8CoB9nxp0UV+rO?=
 =?iso-8859-1?Q?MawDZshum05sgawRamQGW6z3EHUCIKdbK8u5AU7eRHtbjBUH7NJAYWJmcO?=
 =?iso-8859-1?Q?4xOlXQshZ/4ENh/8NRyUoi/y3J7qEZQFbmaveHZ6eQEilti2hEjBsMxdrJ?=
 =?iso-8859-1?Q?z+FQtHRroq7OyNI8upHhMxFoOAl9gOTLKihumAdfYIl2itgL3sxaE8o2Yj?=
 =?iso-8859-1?Q?/uqEVqGBYXy/5slc7BSLcv8TfJwSde75EEkUpDwZkZfG3qqeROFy8YXF2r?=
 =?iso-8859-1?Q?op+b10Ys0dMptqyrGfykOPWgxWe5IAhXJg1WxF1u/F7U/J/8ktSvpzZ8eW?=
 =?iso-8859-1?Q?oPfPuKaID7X12I01yT+XFFMIZB4WGuw2FPGCvOZKAaFadt9RpR86UmYQvt?=
 =?iso-8859-1?Q?dwWje0g4xHGXrUvMdmAuWvK3Gsn/WYqxjRALvH0YMVcev0u3zKCFMd6h6Q?=
 =?iso-8859-1?Q?QCSs3RYAal1XAgV2pGN8STxa8EIiaNMxeIOn4T1Y7tTO+Kofy86ZM1uHwF?=
 =?iso-8859-1?Q?UAGn8CRirCGZUPyRI2yHjA7IqEgwMI3aWPfNAswch6zuBbe5PuHD8VB0aI?=
 =?iso-8859-1?Q?UF3m1CB6GOxiFQzMPNBob/2RleVNtzq0mS9g18K1FLTe/kHQqMzL9ybAhf?=
 =?iso-8859-1?Q?VxaPUaX6vO0EHjwDaBPbwXdfjWJKowgfHjuu2U7yzYvU18f02zZIkWZf23?=
 =?iso-8859-1?Q?2vJtZJM53JTebD8a2dBtOKx8Q37mNlYSBhkI4/lj8lp8TFaGTLmRyi7o0q?=
 =?iso-8859-1?Q?prkt+84EWbHII1Vr13igrqhvEC+jmS23lxntuJfyguWpPoJKyORP+dglqW?=
 =?iso-8859-1?Q?3Q4uVKyRWlepHhLgKEWhV7ELopcTNKruGt+aoyrho2SNcep78vX8Tl75XK?=
 =?iso-8859-1?Q?09EwE7cuyhrQP4NdBMaNqbFBUnCCOUsiHtPvS3sQWDYXako21/Gw5YmpKZ?=
 =?iso-8859-1?Q?KBtCEBbiDPL+fwnjguMAh7c0N8iw8A+uX7hZrh8LskAP4Rxw1+JEkjERN7?=
 =?iso-8859-1?Q?1DIUfuqyNeBazlYHEBgmS2Un5tn+dVDGe21Snv/lj8HJRKZQu6njXTURtw?=
 =?iso-8859-1?Q?H5/zsBIvzHwQ0UtvojsodJUapO3ajXbIRK3EY+OUEG5pzah09NLrrNOh2M?=
 =?iso-8859-1?Q?cIOvUqsJez1reMxyHkQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NXDzNDWopmd5wweOxbe8YADLhR0vWx3n3NBxSi/EcVLPDlL1cNHxZGWM8DBDp9TVVRj+Wys0tQH43V0qqYYd5GiXtX2wVjONmAiWTkyMFuxI6K/4SjyjKICXAp9IOd5xRRoUiSTuugR4q4cbZiBv0yWFH3fmbn4xU5sT1Jq48ZaCmV1daasw0xa5/TqFpembacvbHdcqmSIWaATwWIUFw4oLWfDBlyK03NsEBimQ7osNQchu1puVzAIbywO669dmsCMrtOhSSvnRUFOr12ownPydx2ytn+p3LClKn7yCLuq+Q6Xfm87ULaIGN8gDDh3Yxo9wXVwM+R3L4ZrYpE0aDRaGwXbch2mGq2lzV0zXEor0vPMCYiHZSha8mjYF4+pbBl95Ik+Ji8a+DB5hBbTekY99LzH6Dqfhxh2AvkZK3IF4QCS4TqJ6iDRRNACUlPRm3L2EhAa41QtB0JaNfmVmxzTDKaHJsqe+r8Cjv7lD80yoy3Of5YeBarndAxk1eJiDR9X6/BZtPKEkzDGU+q+bNwIb31Y09sTQcerwY1nr6IR7pCFdZOpOeI1V06i/4mKxCw/O36OLucTKjqiTxamTwAKFHF1o44R6KaDG9WPrc/uC9OmL5tfQlIG1pyFo/wys
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P192MB2865.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 614daa50-0559-403f-871e-08de273ead6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:38:48.3885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzQxQIwqgAwxbWkkFbPIsk536GGYo8Ts6n0LDHI/q4cVZ5ci9Zjqkjtlncs+LZboTnJ2YlAYJL7dSbNEcTYTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB1968
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: PA3P192MB2865.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 2001:2043:ba37:de00:7026:28bf:649a:c86f
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: GV2P192MB1968.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=dr/Wylg4 c=1 sm=1 tr=0 ts=691d7438 cx=c_pps
 a=6CWUjfkwcrT2Gd9wEpnxyQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=8gLI3H-aZtYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=I2gRw-2pW8HTHMd25GQA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: g6ytKqA0eaMi_2GftfKARN0arWENsh6U
X-Proofpoint-ORIG-GUID: g6ytKqA0eaMi_2GftfKARN0arWENsh6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1OSBTYWx0ZWRfXzI7umo6dawCP
 889haPHnce2xjF+UFHWjvbsazKjWtcR94CLT2zsaEdr7MHzIRJszsKKvz2QPf3L8O/nlcGFkTzA
 U1DpPfutF82AuwqmUQZQMQRiidpUje7VLatj8yCymqctl5MaAzUQqhWMgRIf0ViEL5QlPQjDeuq
 LjR0GoGZXx7onm7YbndLspGLesxQu/6KKhLPTHzkd63qtdE5zr9ECjssAGHfsJ1Bp8vKRzkE1IL
 jNqm2ES59h8cMxiNa+U7/U5I0sRLohy10J2+RfjWdff+ZZl57bAq3r35DHHhOudWobiWVVmEkhE
 pfkhu0snN6BdA8KAtOnKcvbTe20XLfa0VZp+E8d9mNZiehSH+kv25LQ5MHsqu/w7rEFpmJrO3PW
 wk5dYm89w4848JAnKYMyNRUfFpb5FA==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A little bit of enabled debugging gave this lockdep irq warning.=0A=
The machine is a e5500 Book-E running in 32-bit (e500mc).=0A=
=0A=
------------[ cut here ]------------=0A=
WARNING: CPU: 0 PID: 0 at kernel/smp.c:807 smp_call_function_many_cond+0x52=
0/0x700=0A=
Modules linked in:=0A=
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.45-5.26+ #1=0A=
Hardware name: wmo,Viper-<LEGACYSWCLASS>12A e5500 0x80241021 CoreNet Generi=
c=0A=
NIP:  c016c9c8 LR: c016c510 CTR: c00d2dd4=0A=
REGS: c216ddb0 TRAP: 0700   Not tainted  (6.12.45-5.26+)=0A=
MSR:  00021002 <CE,ME>  CR: 24004888  XER: 20000000=0A=
=0A=
GPR00: c016cccc c216de90 c20725c0 00000000 c116d440 00000000 00000001 00000=
000 =0A=
GPR08: 1c6bb000 00000003 00000003 76153240 84004888 6ccf16ef 1ff29e0c 0ff51=
000 =0A=
GPR16: 1fe9a6fc 00000004 00000000 00000000 00000000 00000000 00000000 c21a0=
000 =0A=
GPR24: 00000001 c016cccc 00000000 00000000 c0021640 c219b528 00000000 00000=
001 =0A=
NIP [c016c9c8] smp_call_function_many_cond+0x520/0x700=0A=
LR [c016c510] smp_call_function_many_cond+0x68/0x700=0A=
Call Trace:=0A=
[c216de90] [c00dd268] lock_acquire.part.0+0x124/0x338 (unreliable)=0A=
[c216def0] [c016cccc] smp_call_function+0x4c/0xa8=0A=
[c216df10] [c00218e8] flush_tlb_kernel_range+0x28/0x7c=0A=
[c216df20] [c0023170] patch_mem.constprop.0+0x13c/0x1ec=0A=
[c216df50] [c02b71e0] __jump_label_update+0x78/0x130=0A=
[c216df80] [c02b82d4] static_key_slow_inc_cpuslocked+0x9c/0xf0=0A=
[c216dfa0] [c2013494] sched_clock_init+0x1c/0x64=0A=
[c216dfb0] [c200130c] start_kernel+0x40c/0x530=0A=
[c216dff0] [c00003e4] set_ivor+0x13c/0x178=0A=
Code: 7ea9402e 81220000 3929ffff 2c090000 91220000 40c20014 81220080 712900=
04 41c20008 48d64931 2c150000 40c201cc <0fe00000> 82810030 4bfffc30 6000000=
0 =0A=
irq event stamp: 170=0A=
hardirqs last  enabled at (169): [<c0edc424>] _raw_spin_unlock_irqrestore+0=
x74/0xb0=0A=
hardirqs last disabled at (170): [<c0023204>] patch_mem.constprop.0+0x1d0/0=
x1ec=0A=
softirqs last  enabled at (10): [<c004a50c>] handle_softirqs+0x400/0x418=0A=
softirqs last disabled at (3): [<c0006654>] do_softirq_own_stack+0x34/0x4c=
=0A=
---[ end trace 0000000000000000 ]---=0A=
=0A=
Seems patch_mem() in code-patching.c is doing interesting things here?=0A=
I don't get why it disables irqs and calls TLB flushing. How does that work=
 with SMP IPIs?=0A=
Maybe this warning is a dud for 32-bit Book-Es nohash MMU?=0A=

