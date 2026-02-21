Return-Path: <linuxppc-dev+bounces-16998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOcXNfDsmWmcXQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 18:35:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90416D65E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 18:35:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJDmB1Kjwz3020;
	Sun, 22 Feb 2026 04:35:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.144.234 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771695338;
	cv=pass; b=KUuPbrlll2WqkY1XYbtwax9iuohpgYXiq663dgYjhsNwxsVC2tOZ9Wv00j7t2flvvp2zWSrtC/MQIqtgtpJBtvt6v4nN1RihthDYuYhYRbBdoEl6YF4ZWE8OwWeAt63Dx1XpiJxc/kO1axHMhylDmec2m8NaevedZyJCP+hvVi5ZKrQU2TvmR840H/ywC/7foQtsWV1NaosYp+KML3Bk4Urk7Wczzm+Ws0Msq9b8Rkr77OQ3pvdFAXcLlQWw8aHnJknYMRV5XxJZEBCR49WfaCDhpBJeKNm1MCh2J29eyiJvI90OfWjWRrImhQhsN96S8zwaCrRoZ8GODvX79rpyQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771695338; c=relaxed/relaxed;
	bh=0LaV/FjuOer6p7tidwkdo+drc2Agn1EWIBUWUBt40yc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n6ior+IyAdS6bM1V+7uxOtsZAI+LUqgGunLR1Ue5geCo+bSArEYl37xu9+Tin/Ti1CmFx/NhGqNhyqfyIfy1je/ezvEQWKyhLt9cBJtMAZnqJFbm2VXTpyAmU27EoQ8RKjgOdYtr+yjwLWXiKokdCz01LAytQ+2L3Egi5Co8pGhhAEorTIjGQRFdtCREutyfg+NbehlkJVoQ7jbUVfmHsTyzuMAUn06E/rTHBVbBT3GQIMFpb+ulthUT5R99SToyNdTgSbzszYgt9l4oxFZWIyhRYcQNP34qbM7IUKZgqB7yvDCxvmncQcvfV7/eL5CWwZ22KXvrZaVdQu0gPPfmOw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com; dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=tE/X3sUh; dkim-atps=neutral; spf=pass (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=15128ee2e2=mnassiri@ciena.com; receiver=lists.ozlabs.org) smtp.mailfrom=ciena.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=tE/X3sUh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ciena.com (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=15128ee2e2=mnassiri@ciena.com; receiver=lists.ozlabs.org)
Received: from mx0a-00103a01.pphosted.com (mx0a-00103a01.pphosted.com [67.231.144.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJDm76Rk8z2xlr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 04:35:34 +1100 (AEDT)
Received: from pps.filterd (m0174892.ppops.net [127.0.0.1])
	by mx0a-00103a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LFDogB2235856;
	Sat, 21 Feb 2026 12:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=06252019; bh=0LaV/FjuOer6p7tidwkdo+drc
	2Agn1EWIBUWUBt40yc=; b=tE/X3sUhe8vB47UudM3bl3w4foAlBG82kfgiRi0KO
	FbMqp0qg6paVghITpmw+Nk61bkCHD1lfOFKHvN7gTCCMBXc6Y4Dp9D2y96j2rq+a
	2gX7LqVL27claGczkY4jFh+nF7NlcwdGX4jBLKxn8ljRwu0NH1sRZrwrb1RrHoMt
	AY0V1usuvKnW4R5+njkGatHicNQhL+wV5fr6/g8bymDKqG8wlp0xldPd7wUuPO3d
	Vrj2fE81jqXHoCYvDOur02CKdPtwBxKh5QIVX6QeEDapYZbqtAOpkzPnVIfQ7CCa
	r4/6Ll2eH8EVzw1Vdk/CFubBDH6pI2D8wwJcTqzPcD0NQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 4cfaavrf7p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 12:34:47 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxLyZq28Brje4HGp4raMiI65V/DjG/8irxWg3QE6dCA/UBStBo78uYNPGBl1/wH3ZHWaCsslGWYCEJQbKJmehfczPGm7lCJVu3//NU6tET0fiwl4e/tRpBvE6lLlUdznwt1ow5hhYJRmsDHDB/p72hBaRGX3E5j5yUjzN3SSFEdBqPzjXqqhoevv35SGctBR9sUsrYVRmmmH1jmFUjOvZ9wcqS6sjAz5i7mdZ2qHUqNPcAzP4OcheKmSzA/Esqsgeax3jHeo0mIEQzUglMEWb8O158eKM4Ep4kOJUUZ+7VsZtYYRNpxk65X9J6gdXNChjrV+ZFJK7bLSnAUUZuMgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LaV/FjuOer6p7tidwkdo+drc2Agn1EWIBUWUBt40yc=;
 b=g7hOeL2yKfh4F8mEk2IO8KzL1HQ+HW2llcgcW1EIcQo3OKPtKoMOt9RueGA+byGOHqhyhF52PUl0SvQVkRE+CgejidskcxwijUylUbNPiH+rlR2KYLPhiz0pecwmtmn3rOIAKeN28vG1U7r7D5ZCcWwOBGFW0fE0QJa+j/V5ppjtppv5I3t6pe7Aa2Rw7VEp+bfHXCt+M+s2Dmrjlz8NKmRhzqKQbF5qNu87B+tB1KXf9g7Pr1iDXjDFSukSlkxaJz3lSScXyZYhgP/VXysqSE+MBioV61vJf4g3b0HtnJ/zNBJIgx7cXev8gWit529p6fnraVKypKkeE10wCfdRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from CH2PR04MB6821.namprd04.prod.outlook.com (2603:10b6:610:94::20)
 by LV3PR04MB9257.namprd04.prod.outlook.com (2603:10b6:408:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 17:34:45 +0000
Received: from CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103]) by CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103%6]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 17:34:44 +0000
From: "Nassiri, Mohammad" <mnassiri@ciena.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
CC: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Topic: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Index: AQHcoEcGeCnVUQeYJUiohhPZh5dZMLWH762AgACHazCAAsSIAIACMCsq
Date: Sat, 21 Feb 2026 17:34:44 +0000
Message-ID:
 <CH2PR04MB6821998651F4F3C1853C36BFC569A@CH2PR04MB6821.namprd04.prod.outlook.com>
References:
 <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
 <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
 <CH2PR04MB682162D39BB7E7EB0F0695AFC56AA@CH2PR04MB6821.namprd04.prod.outlook.com>
 <38e1160d-26ea-4432-9ca4-1c606dd187ac@linux.ibm.com>
In-Reply-To: <38e1160d-26ea-4432-9ca4-1c606dd187ac@linux.ibm.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR04MB6821:EE_|LV3PR04MB9257:EE_
x-ms-office365-filtering-correlation-id: 3f590a0b-65a3-4a62-a054-08de716f80c7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|31052699007|39142699007|366016|376014|13003099007|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Zlo1SCyi3x3oXPub4KJgqoYUKgdU1u9MUjkk88RoVncDPEiAsrs/O6avggLI?=
 =?us-ascii?Q?D3xKcgVVgSJEO03lGZk2eVetdeqyBGZ4ECmV+qL8E7u+sy96yv3eAPtqBadp?=
 =?us-ascii?Q?Xd4LyZHMMnvw4bFRztMwEFRriNAvYvxnVcnHdKrr1eKfqsRKo3Uj8E+LQwgA?=
 =?us-ascii?Q?9qJlcJYToM95UUicttdCiD/0zxphvqrLO7IneLsdqOLVAA11CD4uPgINwCQW?=
 =?us-ascii?Q?vAVOQ5u7ph7mrS36rJr+Gij/imoZ1l9ImefWqkk7jFwVpmIHB9+xwcEVEGx1?=
 =?us-ascii?Q?+2Rc4kGgei4Fe0x4XovgLTA5gk9qOodRBhhiQZM6PZF6w49iXWAaHMhisfMR?=
 =?us-ascii?Q?Mu1/qZk+hP9KZfvoRKR7UhDpVNcpUYGtV8oyI2o4Cexnqe757cpOs9sK9ID9?=
 =?us-ascii?Q?08AZ0BrCcC0Hg/qhqxYh+lruABza7kEFHL3ZGPLZh20ReQKFnISKwk3STd7N?=
 =?us-ascii?Q?NblWVhDq5J8FxJt1qbfi4bGRG95bG4PKIaUC1tJhCogb9PrCW1AUhj1N2zUN?=
 =?us-ascii?Q?xoBFGlXFIruf9R9h5UlEDxnINFhItXmMxZOLUhekLXDaGKuGXdRpITAwlE5B?=
 =?us-ascii?Q?mexC2B5xQQOxfVkTVKuv825KPVsDskOIZj+aRBseRLKQFP/4nm3mdHLmDjr4?=
 =?us-ascii?Q?krRhfdy1WfbTWkqYLcejdBjQbttfBudQEXAs5jZ9d2JqD4/E1Rha+nEDjx54?=
 =?us-ascii?Q?ZWmntVdjvDd8YwB9nArruTgCWk2i85iNFxhE+OhlZE4zajYZyCdffgqpNXWJ?=
 =?us-ascii?Q?xxROiwbgDCz7SwfqpXwvDFy9mi7zQ8AHmxe6yA22ngWqoMvDd7HzM741kok/?=
 =?us-ascii?Q?dZdsVmqaK6yDZoP26JsD8ULiW7Npf0f+P0ueFqIRiQyg5v+wqzh7D2Vm5Aff?=
 =?us-ascii?Q?BTund4HIeAjaUn9cgJDVt7VozgGUUOJjutdgjIl1JyJ7y7QuFcNtyudWQ8WA?=
 =?us-ascii?Q?cq5c7kCjvLcbvmC8T4qvPqjcz0qQfXz1OqFJCjL8q0HbDRd3Nt6AJWce6faf?=
 =?us-ascii?Q?gpYg55v90CfOapwr3wm2SQ60Z2o1lLkYqOMx0/T5z25jXuAUROV0utcpNgj6?=
 =?us-ascii?Q?GVm2H5zG09mKRsWGtuuQxh28p8COOa+WnyPrml6BKx6BJyqHak1VFcLcEN36?=
 =?us-ascii?Q?8D6HJQNUJVfpjUwVMU9Oe82clKNESh3NXL8eIayyI3nZfGfyh74WKHbCl36u?=
 =?us-ascii?Q?tpBptarMCgWASEfuzH4aEz0/RBY+SEWgb0eWzLCHOlkP9UcbhzsQMf8fw2LU?=
 =?us-ascii?Q?U2E2lh7fGugbwKdJXp69qfxM1dgcWs3YIRkd2G3nTlAAROvbapBB8RTDVZ+a?=
 =?us-ascii?Q?jzM2gVorArSSokooFszh99sb6GUiQ1R3YFtHioTqMT8o4OhHcK4oAVAHxp/F?=
 =?us-ascii?Q?z9Ob9VGYqXo+Adrpwn+pveDsnfCh0VGPN5Zryb0lLiSRvuRI2ZW8T7pKtd4Z?=
 =?us-ascii?Q?APpU8c0jh4V9iBaNfiRdV3IM3X7i8b8vml6n3mlu8WWRUveoGjVQj/wa5YuQ?=
 =?us-ascii?Q?ZrrhlqFS+Pr3VqTpUFcPpWdd4uyyI188TyTJibGh/gKsPYqYZhStZiV1TvOC?=
 =?us-ascii?Q?HlEBFV/zfJW31AIfZ/9v0zIkhzqLCPNCnrUpdJZr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6821.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(31052699007)(39142699007)(366016)(376014)(13003099007)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fm2x+lUao9VcspU+E13RCuWbgxdFSMnau6p3HzS6vA3BNgHwoPZvMhQt73GJ?=
 =?us-ascii?Q?I3sY0OVUdn+6BKpZta+lm3wZFHyw6QmZNvk9V5jOrNWWgjluvkW45DW03c4g?=
 =?us-ascii?Q?dk/bQTf+ACJ576bteNB6PGdYB+soIi3OLsBiqZfnDHK1Kg/UwIrFf3GzasJ3?=
 =?us-ascii?Q?u/rbse84UdY+BjEENUX+nS2zThW7STR9Px5hU6TOpKtRp8H4x+AtKeHfX5rr?=
 =?us-ascii?Q?6jb/cv4qWyPU6nBWFW5DMU5tuGkP26NxhhFBkuFgxFZVMNUCAUbAAOoN4TCm?=
 =?us-ascii?Q?k/N0r8ek7jz0b1UWhPt3V+cucA9aQjOf8RzEz+oXLwrlBpmKnkA/iUMGAQ+6?=
 =?us-ascii?Q?n9jrIdISAlXCgjbQmUy9UvYvfPRpxqKQ/zaytV/yguRJjFSQFniVassTLsFB?=
 =?us-ascii?Q?VGrlw0RUnFpmPFJpyiGHK0cXcZnNBtcXu1kkofzQeT6cTTnbKU9hFBCFwldK?=
 =?us-ascii?Q?9XS9K4WgLsQRQhyzBN+mbEgYUtYZKeUmRr/iSm2PCzP9FApiqVc/VDG37X9t?=
 =?us-ascii?Q?ttayoOUqibmvhz6KFJF88nkNxqM2by74Ua6ERB+kItb5p335Wlg94KIUA6rz?=
 =?us-ascii?Q?yjpqUfBkHJXFsayq4RNjrOXzSrUJszU+SXYav0qAqqzpXstrYNX7RBtrlepJ?=
 =?us-ascii?Q?CQvdfa42Ir92o6FPCv+7e96LsUkrRQzecKA/JUxp7l3I+wTc0USzKkz/wmO7?=
 =?us-ascii?Q?DVIiuRrQGQpOwGDXx1Px8/xAI1+2ozA0lXMobMUTdTUfPL8jk2gVYyMcKz+S?=
 =?us-ascii?Q?IFUKZ82V/LJAYplzVVGNu70s1pzbeaMr/ySHIpWUsbBlMpdoLA5KQkIk7DyE?=
 =?us-ascii?Q?9MrgKi3E1x47Z/knHSK9xZsZkTHmEDWZGzW8/+kFMI2AwT6QuoKVTarumPTF?=
 =?us-ascii?Q?XNdj89SfULEXjEEJrVCXrZ3n+Kp3KFnB/J1tfLLRG84IB1QxNUnVB3+8DuUX?=
 =?us-ascii?Q?JM4OAHHcFiOjovCXgHOPunfSEU8Kqk2h8MsJ8CTffM1SEeYjDdzaX+c5BIAm?=
 =?us-ascii?Q?PQMajtDfhCCnDAVfmsZDwirTiJyPaTPN8c2aFtOFH+15VVseJcpoCFPn5Cns?=
 =?us-ascii?Q?bsvl84BDopUQWKjbQoonvvlTg+plXvw1DjQw5S7p/hNg6vp6a1o/fzDO0rNH?=
 =?us-ascii?Q?YTJeO11Xg6u7ms60BTVUcYEsErW4m/x1wVquxZ0DvHXmcJphfMBMTKAsADtk?=
 =?us-ascii?Q?Dn/y2afFFvrWB6TsrqdtVgGv7hNx3/7wwO2iGOKwpFXxstGigeq9NM4s6k6R?=
 =?us-ascii?Q?pKPTypH+P4Dl13h7drevWl+I4y/gOkJcIIud3u6fWAdlzF6PxBgOFiv5LuD1?=
 =?us-ascii?Q?l2IIir04C9ZTGGlmBDOAq42c4GEvKOxDCtszkfE+5yO9ah+bk3LLVhOsa/WO?=
 =?us-ascii?Q?XiYddaWUHbOpqTqciJ+bxD7T83rMXz00cpJZE7WNrkNwHM/OmDoJbByOuErr?=
 =?us-ascii?Q?PKA6rVxahweJyBTXPMAss9H4Cg4ojAHqYYfOSHrXCKfcgrUlQUtDWIui4Q3o?=
 =?us-ascii?Q?ENWVmRRs7EoeRfNSmQWh0SJJIMb+i7wwNQ9Ap5R9NI2s3EXzdY8HaaaoIre4?=
 =?us-ascii?Q?YXro5QX6/d6PofX+ZB7uwIHQQEYliF8653yaYoy3iU889EoPc5Ng6I+Aio9E?=
 =?us-ascii?Q?k1LEx9RR6ya2/R7pgo/99LGgUqqmzDhcboHPf1+nUr4aMBEzTf99gnIGbutK?=
 =?us-ascii?Q?hBQyXSEDk4h2ks4j2Iv/OzOcagw2OST8wru0E3R9FkInF4l2?=
Content-Type: multipart/alternative;
	boundary="_000_CH2PR04MB6821998651F4F3C1853C36BFC569ACH2PR04MB6821namp_"
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
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f590a0b-65a3-4a62-a054-08de716f80c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2026 17:34:44.8800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxfpTlGCEUWx+You+VwTPv+t8LSoWEtWlvVVDD08XiC7XImWwstUNe6yf/BxFykUjZhC+oEsVw88PiswHMMcdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9257
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDE2NiBTYWx0ZWRfX1iHxu9Rj3PEY
 O7d2iXGWEyiLCCDmZUsFgTdMz4JAvBS3beAs2VWp/56g0m2YdTwWsaKT9wqTq7ANPmT9Yggudr3
 WCROb4RqiUDv5ymXX8tKLZONJx37CYZ3NQp6eZJQFd0v4ImNQjpv1tpN3cCeUQvlUQWY3RXcHnC
 Wyj7ZGlJvCz4CVCmwAdpZvwsAf3tRDpjnbK6SguvpkJdjRkqHzNRGusWaJ+l6Oh3d9R4BxNclsj
 jQQZlfcOcQPuLc07w1fnHxF/QcefxPArE6PVG3TH7SLSmY4M7gEo0Bk4OCXTftQXHqKAJIufpls
 +iU+d8FyFdtIfXTw7luQE1P3jnUYb2RtrdH0F6BS80jh+V/27aKmqepR0S94Wt6IyzRwkaF/G2v
 JgKwpW475EiUSo05vS5Ei4zGF14DiviGOxY+tWTQlr2y3o5Z3bMY1SSL7UlUOpWwqw4fLvvC0q+
 4oJLJ3CjtYOLys4kjdA==
X-Proofpoint-ORIG-GUID: ua1nKvO7pjvBnUlHzBJ72VtRAE_3syPA
X-Authority-Analysis: v=2.4 cv=KutAGGWN c=1 sm=1 tr=0 ts=6999ecb7 cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VAHoBZaOFNLaZKSTEpSs:22 a=asf1GtvIhB2b7_af8tXQ:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=7d_E57ReAAAA:8 a=VnNF1IyMAAAA:8
 a=FmoMKUsJAAAA:8 a=voM4FWlXAAAA:8 a=KKAkSRfTAAAA:8 a=1UX6Do5GAAAA:8
 a=pGLkceISAAAA:8 a=meVymXHHAAAA:8 a=hRciKv5lfsncZIoD-pkA:9 a=CjuIK1q_8ugA:10
 a=f1JhAmQPGwJBN0WpxtcA:9 a=vGJqD6S_LPHq5YyW:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=jhqOcbufqs7Y1TYCrUUU:22
 a=IC2XNlieTeVoXbcui8wp:22 a=cvBusfyB2V15izCimMoJ:22 a=Et2XPkok5AAZYJIKzHr1:22
 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-GUID: ua1nKvO7pjvBnUlHzBJ72VtRAE_3syPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_04,2026-02-20_04,2025-10-01_01
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ciena.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ciena.com:s=06252019];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,linaro.org,csgroup.eu,gmail.com,goodmis.org];
	TAGGED_FROM(0.00)[bounces-16998-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,m:rostedt@goodmis.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ciena.com:+];
	NEURAL_SPAM(0.00)[0.986];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ciena.com:email,ciena.com:dkim,CH2PR04MB6821.namprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: AC90416D65E
X-Rspamd-Action: no action

--_000_CH2PR04MB6821998651F4F3C1853C36BFC569ACH2PR04MB6821namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Hari,

I could find and resolve the syscall tracing issue.

The root cause was that within my toolchain and the PPC64_ELF_ABI_v1, the s=
ymbol resolver can provide data symbols without a leading dot (e.g., sys_re=
ad instead of .sys_read). In our system running kernel v5.10.x, this was ca=
using a mismatch that prevented ftrace from correctly mapping metadata to s=
yscall numbers.

https://elixir.bootlin.com/linux/v5.10.174/source/arch/powerpc/include/asm/=
ftrace.h#L78

I could fix this by modifying the matching function to be dot-agnostic.

Also found the fix in the upstream:
https://lore.kernel.org/all/20221201161442.2127231-1-mjeanson@efficios.com/

We might need to backport this to earlier 5.x stable version.

-- Mohammad

________________________________
From: Hari Bathini <hbathini@linux.ibm.com>
Sent: February 20, 2026 2:54 AM
To: Nassiri, Mohammad <mnassiri@ciena.com>; linuxppc-dev@lists.ozlabs.org <=
linuxppc-dev@lists.ozlabs.org>
Cc: linux-trace-users@vger.kernel.org <linux-trace-users@vger.kernel.org>; =
michael@ellerman.id.au <michael@ellerman.id.au>; masami.hiramatsu@linaro.or=
g <masami.hiramatsu@linaro.org>; Christophe Leroy <christophe.leroy@csgroup=
.eu>; Nicholas Piggin <npiggin@gmail.com>; rostedt@goodmis.org <rostedt@goo=
dmis.org>
Subject: Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/pe=
rf events on PowerPC vs x86



On 18/02/26 7:26 pm, Nassiri, Mohammad wrote:
>> You should see syscall enter/exit tracepoints on v5.10.x without syscall
>> wrapper patchset referred above. Are you using v5.10.250 ?
>> Also, would help, if you can share the .config you used.
> Hi Hari,

Hi Mohammad,

>
> No, I'm not using the latest v5.10.250. I tested on two versions --- v5.1=
0.174 and v5.10.239 --- and I still see the issue on both.
> For your reference, here is a grep from my .config showing most of the tr=
acing options I enabled while troubleshooting this issue.

OK. Tried v5.10.250 as well as v5.10.174 with the similar config
options. Could see syscall enter/exit tracepoints..

- Hari

--_000_CH2PR04MB6821998651F4F3C1853C36BFC569ACH2PR04MB6821namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">Hi </span>Hari<span class=3D"elementToProof"=
>,</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">I could find and resolve the syscall tracing=
 issue.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">The root cause was that within </span>my<spa=
n class=3D"elementToProof">&nbsp;toolchain and the PPC64_ELF_ABI_v1, the sy=
mbol resolver can provide data symbols without a leading dot (e.g., sys_rea=
d instead of .sys_read). In our system running
 kernel v5.10.x, this was causing a mismatch that prevented ftrace from cor=
rectly mapping metadata to syscall numbers.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof">https://elixir.bootlin.com/linux/v5.10.174/s=
ource/arch/powerpc/include/asm/ftrace.h#L78</span><br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I could f<span class=3D"elementToProof">ix this by modifying the matching f=
unction to be dot-agnostic.&nbsp;</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Also found the fix in the upstream:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span class=3D"elementToProof"><a href=3D"https://lore.kernel.org/all/20221=
201161442.2127231-1-mjeanson@efficios.com/">https://lore.kernel.org/all/202=
21201161442.2127231-1-mjeanson@efficios.com/</a></span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
We might need to backport this to earlier 5.x stable version.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-- Mohammad</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hari Bathini &lt;hbat=
hini@linux.ibm.com&gt;<br>
<b>Sent:</b> February 20, 2026 2:54 AM<br>
<b>To:</b> Nassiri, Mohammad &lt;mnassiri@ciena.com&gt;; linuxppc-dev@lists=
.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&gt;<br>
<b>Cc:</b> linux-trace-users@vger.kernel.org &lt;linux-trace-users@vger.ker=
nel.org&gt;; michael@ellerman.id.au &lt;michael@ellerman.id.au&gt;; masami.=
hiramatsu@linaro.org &lt;masami.hiramatsu@linaro.org&gt;; Christophe Leroy =
&lt;christophe.leroy@csgroup.eu&gt;; Nicholas Piggin &lt;npiggin@gmail.com&=
gt;;
 rostedt@goodmis.org &lt;rostedt@goodmis.org&gt;<br>
<b>Subject:</b> Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ft=
race/perf events on PowerPC vs x86</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 18/02/26 7:26 pm, Nassiri, Mohammad wrote:<br>
&gt;&gt; You should see syscall enter/exit tracepoints on v5.10.x without s=
yscall<br>
&gt;&gt; wrapper patchset referred above. Are you using v5.10.250 ?<br>
&gt;&gt; Also, would help, if you can share the .config you used.<br>
&gt; Hi Hari,<br>
<br>
Hi Mohammad,<br>
<br>
&gt; <br>
&gt; No, I'm not using the latest v5.10.250. I tested on two versions --- v=
5.10.174 and v5.10.239 --- and I still see the issue on both.<br>
&gt; For your reference, here is a grep from my .config showing most of the=
 tracing options I enabled while troubleshooting this issue.<br>
<br>
OK. Tried v5.10.250 as well as v5.10.174 with the similar config<br>
options. Could see syscall enter/exit tracepoints..<br>
<br>
- Hari<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH2PR04MB6821998651F4F3C1853C36BFC569ACH2PR04MB6821namp_--

