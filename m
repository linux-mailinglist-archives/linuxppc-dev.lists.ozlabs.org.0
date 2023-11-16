Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089C77EE542
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 17:35:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=eIU6qm33;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=W9bqD0Lt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWQdF6jC7z3dB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 03:35:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=eIU6qm33;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=W9bqD0Lt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.72; helo=rcdn-iport-1.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWQc86Z0hz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 03:34:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1414; q=dns/txt; s=iport;
  t=1700152489; x=1701362089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eFAxG4/WJr++CtiX1rmGXrTGRWDhBBL7+JWVT6R2HKs=;
  b=eIU6qm33D4Rsiwn8oTwROlxo+ciwqpUqYzmJhOF/DqBin0kR/zNcl2Pi
   7g65voTS8Iz6eCAtxce3LFP8e3ldhv8ABq+HhYOqvMtciERW4gNes3ib0
   5XQhqWVRxz97QhuHGuep7Tk1/07gbjPE8Ij4tQehVRa0PGEj3T3mJdOdc
   Q=;
X-CSE-ConnectionGUID: IxnI7HhOSf64ty8U8zd1ig==
X-CSE-MsgGUID: 0Md2yU8tScuXJndu57ih0w==
X-IPAS-Result: =?us-ascii?q?A0C7BABqQ1ZlmJpdJa1aHgEBCxIMQCWBHwuBZ1J4WyoSS?=
 =?us-ascii?q?IgeA4UthkGCJYV6jEMciyUUgREDVg8BAQENAQFEBAEBhQYChygCJjQJDgECA?=
 =?us-ascii?q?gIBAQEBAwIDAQEBAQEBAQIBAQUBAQECAQcEFAEBAQEBAQEBHhkFDhAnhWgNh?=
 =?us-ascii?q?kUBAQEBAgESKAYBATcBDwIBCBIGHhAQIhcOAgQOJ4JegjwjAwGffAGBQAKKK?=
 =?us-ascii?q?HiBNIEBggkBAQYEBbJtCRiBMIgNAYoOJxuBSUSEPz6CYQKBRhqGQ4NthTgHg?=
 =?us-ascii?q?lWDUo4YXSJHcBsDBwN/DysHBDAbBwYJFBgVIwZRBCgkCRMSPgSDLgqBAj8PD?=
 =?us-ascii?q?hGCPSICBzY2GUiCWxUMNEp2ECoEFBeBEwRqGxUeNxESFw0DCHQdAhEjPAMFA?=
 =?us-ascii?q?wQzChINCyEFFEIDRQZJCwMCGgUDAwSBNgUNHgIQGgYNJwMDE00CEBQDHh0DA?=
 =?us-ascii?q?wYDCzEDMIEZDFADbh82CTwPDB8COQ0nJQIyVgUSAhYDJB04EQkLLQM9A0QdQ?=
 =?us-ascii?q?AN4PTUUGwZnonqCGIEgll8Brn0KhA2haalymECoKwIEAgQFAg4BAQaBYzqBW?=
 =?us-ascii?q?3AVgyJSGQ+OIBmDX495djsCBwsBAQMJimEBAQ?=
IronPort-PHdr: A9a23:TFInzx1uzXMnxCWrsmDPZ1BlVkEcU/3cJAUZ7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF95L+L0F4rNhuy81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:vdSSJaOUkI78uDjvrR2Wl8FynXyQoLVcMsEvi/4bfWQNrUoj0zNTn
 GRKCD3QOqyOYzH1fownYIq29xsBu5LdnNNjGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCdaphyFjmF/kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/W1/lV
 e/a+ZWFYwb8gmAsaQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WHL1A2eDnIV+Ev5LP01yWTiv+z6xvAxRjVWEY0r4f7WBm7
 /cULnUGaQqOwrnwy7OgQe4qjcMmRCXpFNpA4Tc7kneIVrB/HMyrr6bivbe02B88j8ZPEPLBb
 uISaCFka1LLZBgn1lI/Uclvzbn53CWhG9FegAqwqfAm3jjP9wds4JrrPMeIJd2KHdoAyy50o
 UqfrzimXXn2Lue3zTuD72K0nuSKkS7lcIYTD6GjsPl4hFSZ3SoUEhJ+aLegieOyhkj7UNVFJ
 glPvCEvtqM1skesS7ERQiFUvlalrhg9BPpQNNY0tl2R2/rpsxSVX2kLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dZ573urKxd9VEXVIRVLudRPoXiNeuYi//9tbYgbnC4c9T/bv0bUZDBmqm
 1i3QD4Ca6L/ZCLh/5+69lDOmT63oZ6houUduViPDjvNAu+UmOeYi2GA81PX67NLK5yUCwLHt
 3kfkM/Y5+cLZX1sqMBvaLtUdF1Kz6/YWNE5vbKJN8V6n9hK0yXyFb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI511lfC4So+9Da2IP4omjn1NmOmvonkGiam4gTiFraTQuf1X1
 WqzKJz1Vi9KVcyLMhLsF7tEuVPU+szO7TqDGc+kp/hW+bGff3WSAawUK0eDa/tR0U93iFu9z
 jqrDOPTk083eLSnOkH/qNdPRXhUdiJTLc6t9KRqmhurf1AO9JcJUaGBmNvMuuVNwsxoqws/1
 i3lBBcBlwKi2BUq62yiMxheVV8mZr4mxVoTNi03NlHu0H8mCbtDJo9GH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:SmAZtK8f+T2EyH1SW49uk+Gqdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBQpTnhAsW9qXO1z+8N3WGIVY3SHTUOy1HYXL2KirGSgwEIeheOuNK1sJ
 0QEZSWZ+eAcGSS4fyKhzVQVuxQvuVvk5rYxts2rU0dMT2CApsIh2wWe2PrdnGeBjM2eqbRf6
 Dsnvav0gDQA0j/Gf7LfUXtMdKzweEjvaiWEyIuNloM0iXLpzWu77LxDhif2Tkjcx4n+90f2F
 mAuTbUooG4vd+G6jK07QLuBpJt9+fJ+59mPoihm8IVIjLjhkKDf4J6QYCPuzgzvaWG9EsquM
 OkmWZkA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMBDdZbj44xSGqc16NghqA67E
 t45RPBi3NlN2KZoM073amSa/herDvznZPlq59Is5UQa/pCVFYbl/1twKocKuZ0IMu90vFkLA
 GrZ/usu8q/tjihHizkl3gqz9q2UnspGBCaBkAEp8yOyjBT2Gt01k0C2aUk7zo9Hb8GOtJ5Dt
 7/Q+5VvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXJVj8DqkIN3/EtpayudwOla6XUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kb7Zlkvb/3QqbtLES4ORwTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIMxAH6U4k6EwhXbCTUgKdzZ7ujmLO8FmSxjJ2uTB/6HsubLQoZ
X-Talos-CUID: 9a23:QkxZf2PSAXafiu5DeTlh1RE0GucefCOB0GaAHh+qBT9oR+jA
X-Talos-MUID: 9a23:ItC67Aso3F3xvhyt+82n3BRubtZVs7iVA109s5MKppTbNCwoJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:33:35 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AGGXYWa008539
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 16:33:35 GMT
X-CSE-ConnectionGUID: 33fZnu+cRa+4LqhiY8FZ1g==
X-CSE-MsgGUID: xQxCZZzPSHOeJ7bylbehmA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.04,204,1695686400"; 
   d="scan'208";a="8667584"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:33:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6+PlBa+H1COpu683iGQhxccnnFn+yFIRx9Oc42Z6OOA6FaPf3//uNx1a7tOpttR0hwtFlS/9TaEflFqU/V/5CdbEmBRizfwz2Qvv78A8/deqlO3/WwzorBmNT5QWkso1wOwwbzU0HMsGgBQbwOQFp7dGFbSxDERtdujg0WtQlMQ4DGodNn7zkSZzi9s+Dxmpudbr5AQSTlxNjyPsW+ed6dTNOgChyNFZ6MUh3YrbcjP+kv/LPuR73ghSJZJ/H6raHvGxeFl+ZYRoqBKsMwj/yFbcZcu0ZEjppAAVVU4rdo86Um3QFW9lJO6rzlNzJr6RRWUzYKoC1LcBGN9rExOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFAxG4/WJr++CtiX1rmGXrTGRWDhBBL7+JWVT6R2HKs=;
 b=BOhWtbChg3wJ/lgqEv91bZ4Qc862RXOs9OasPw9fymGeTQV1p2eIVuEwk6t9vQhB6jCztpvIzWVl2aD6hwy9pEY1qZJX+cL8cHaTUp66MJdtPIfv/+ScTwnY2v6WCXQn2Q4K11VpHkRSuMS11ds/7hSaxPRsQXXMNMHRqhrHrpl3xLI4ka71ca+tVT4++7oCJs2Jb6L/ec0fV8mq+7/XmvHYSSo5mg12DrJpgTjdTiOtI1w9XqQYhVQw2bhJoZB3uZj33IRjnvs0hpYnpFEUMEWP3FT/qX1N2B5UHYsFuI5eQB2DJVWyuUEokBBwS+DdZQYnA5QzqcKGCW/vsC5/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFAxG4/WJr++CtiX1rmGXrTGRWDhBBL7+JWVT6R2HKs=;
 b=W9bqD0LtH86VVATcYs4emZtrk2Gxws/LceimluuPQL6AKftFxpJhd97poYsI3uhAAYhlWVqpU4ZT49RSLNyBHCZUSAC2+8/4Gtj5cgEVaOI6Yq97rs+cftVXDP28uM2LS2xAzxcZafx7k8dj/K4Dvwz/vw434Wea3JRA+uqmlAQ=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 16:33:30 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::a59:2fb9:3446:4f8%6]) with mapi id 15.20.6977.018; Thu, 16 Nov 2023
 16:33:30 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/8] of: replace command line handling
Thread-Topic: [PATCH 7/8] of: replace command line handling
Thread-Index: AQHaGKqimZTUK+RlrEOBqmo5AZNg8g==
Date: Thu, 16 Nov 2023 16:33:30 +0000
Message-ID: <ZVZEWrUKh8N/a7SL@goliath>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-8-danielwa@cisco.com>
 <20231116160936.GA2376455-robh@kernel.org>
In-Reply-To: <20231116160936.GA2376455-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: c8f209d5-b50b-4462-5b57-08dbe6c1c4cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qiSNVa3w9N//VzXPf2FT9Q+0RKoCxknpv2ksPkGpXPD2RDg3SYKYOaxTMT8OwqijyXSQXTtkuoDj+81p+CAK0Yj49N8u25X2eBlzj2Dr4LI3V5ao/wA1t/nVlltam8j1cl/c7aQQBdFIIIplrkY/OAPgJNfd0fQIKv7HtfCxmiDYW6AsLJJqHjYaE1muTxGsHJWj4qi+GGeTewCSnKKd0PzO4Qr+jNBmJgVLvTmqcQfVH03161PD5vCVbnwY/+TJayGkRPjyWXnfKmt/LyVsUSW8214GMk8FfmzmGZqaAPSgdiE2mRajLf6LfPULfjpHTQhkumkzebhbrhRhGL7iavhe5cF/e0qI55FIKx4fyBRyR7o5Po+rxt21hXLNZlW0EvRQyq34SwCORrZKdiCvwEE+PoxnjTp8o9Bz9pqS64UxwsUJunnkKrRReH/ds3eGbuaGPSOfFNsIo/uvySx9nUPbhyGXH+l7to08cg0spLTbF8iiGOWwmpDfEMvp/kesGffrx0n244WhqUyiAzL3ZIDh1hMC0yGHy953AAVIomPc20IlZNjVSeW0V12Q88dGpxNEUXwht40+5Xhw46OvYealsjF5txOXKPMImBov4wxFFPLPfQPDqMRwjXrs1JJz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38100700002)(71200400001)(122000001)(9686003)(6506007)(6512007)(2906002)(41300700001)(7416002)(76116006)(4326008)(66446008)(8676002)(5660300002)(8936002)(86362001)(66946007)(38070700009)(316002)(66556008)(64756008)(66476007)(6916009)(33716001)(54906003)(26005)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Iv9noZjdTO+6KCpTjwc++wQPPEhMtQ3l9xsnkmGdhD36iEZMTxmxsJE4U6xM?=
 =?us-ascii?Q?CSUrSZUC54AV0/8DmDj5n060BurmjKMkTIm6WYG2PMTNTg0A2MJXURoIB4Kl?=
 =?us-ascii?Q?EsUGu/Sppw9alVwYw8xRdilyevY+GR+Y+lSkiz1wSWvkNo7LPuFf0NGFyTrc?=
 =?us-ascii?Q?n9mx0xWqNr5ESVLIbJZs7w6ykpxJQnZAuTCI5rsRC8b9e3AltLjHIP2NCFYF?=
 =?us-ascii?Q?O+iDJb14pzxRUHfgzKdLsnzd3Kog0zNUFIefI+MjQN4IKplwb6QtZ829wGOq?=
 =?us-ascii?Q?ePYN5lTPQr2zvQ5MkOtLS5nhUJPv4riqhblijR08+zC/FLhazSh1DXjxBORe?=
 =?us-ascii?Q?mrkt1p9LTcdlDPs1vuHennpYGbVjJKWye+5iABTD5MqJw/TsTAVvP6P5IIdD?=
 =?us-ascii?Q?UMv/UWVG++6chor+QzbaON9lCgdzuEDswNT/ZxhwY8FA/I/ghSW76vs8d1Im?=
 =?us-ascii?Q?FUELzF7xki62V8S5ELF+HT+X60auQOvV3krDEYskylsNjVQnnAaBC2jt0kIa?=
 =?us-ascii?Q?5n8oCvEDpa4bFmceSVbEZVy1PweZHgY5Kjn8qr5ZZ3Setq8GnhKDiZVZPJrJ?=
 =?us-ascii?Q?CxsZIbputJ5WIYGrH2XJvvyCckkzkkfatnf40syOZq52967XFsFr+XvYZ2fK?=
 =?us-ascii?Q?8Y675CJ9KzxvKFmo+kbGF7iATHl7k1ebeyGGIQN9HzkYEUlQlqQgf2DJEDmZ?=
 =?us-ascii?Q?bamwGSCMpGYeOjVbLPxCiCtRLpPCylQggmzB5mb4MIS29t0hxTK596oXiNN1?=
 =?us-ascii?Q?z4Xeke08h+DKrQcKE8eURn6ve85UhuTUk+FAkEfKoBL4K2rwQokYoWdEcIMy?=
 =?us-ascii?Q?nE4LeMJkOJkPU1p3E+Wb3+NeJrvlvokNC6ZSUos5xZyUaoS/BJ24vTCJCzSU?=
 =?us-ascii?Q?5P6yQEFTnLeAsRKEaqAeAGRCVBJHebbBZAQ4KUn6y+4px45/yAdlK6p2xaPO?=
 =?us-ascii?Q?vnz/r6H0VU3mysba5uS3l3miasLh0Y6tn/VTjj4BbB1eyZPk0zluvW0NT5w5?=
 =?us-ascii?Q?3+2aYL15XDB7aBSQ1PD7fyo1OCEyfx48nLOKi2KLgL8SNYosr5gv4OPtoiM6?=
 =?us-ascii?Q?z7cyj/PiTpvv71quuPD+CIjw4QtKvrQUUIyJIySJgiueZFqEAmHCN65i1XSk?=
 =?us-ascii?Q?Vcpl/5QQPSElMOTL8+E+dqP4iUgCLH8MOip7XnhH9QEnENfgHUywqRPNpDUd?=
 =?us-ascii?Q?kA8Tf3sh94RuBa7sGx+PWSyNTKv/PP8G89grVK77dqcX+swWTGlINi8zS5i5?=
 =?us-ascii?Q?YFJ5yuzpWlWncdpfaXWeK+Wg3iuIdNCdF1cUAV116QBszqKsgmAVMkdAODZe?=
 =?us-ascii?Q?ufcFEIQPygjP99yd1DFJ/sBvlyUHkV/c2BnXv4pXI8XokPNM3ub7RpljD7a2?=
 =?us-ascii?Q?tqFoATlrApn8XRKeJqqDE4Wxz5M4PSE2zsCs0KrVbSV1ojzwKuWB7bgOxJSa?=
 =?us-ascii?Q?PIIW87cdz3pCrZVD0h6YUiM638sNQzRxnEqynPux69VEt6ZBFFAeALEPnKkw?=
 =?us-ascii?Q?ISh/pNnAq1NXRDtYFeiq9KKG4iLXs+u2w3ilnfQtIy8+zLLR75v2h22ZHdkb?=
 =?us-ascii?Q?I2AtSk41RwQ2RvmAif39K0Pf9TDUR5d94UOEum5U?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <405AF74430C7C942B5D4E2C47414D4F3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f209d5-b50b-4462-5b57-08dbe6c1c4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 16:33:30.7709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lRKbfiUnd7kxx2S/D3MOjE6RhSdHvBIndWCTFBOKm8V/EGRKtJzk2ZQzVhWpWaTJeXhwpwFuU5WtOiTGo4QRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Frank Rowand <frowand.list@gmail.com>, Sean Anderson <sean.anderson@seco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 16, 2023 at 10:09:36AM -0600, Rob Herring wrote:
> On Thu, Nov 09, 2023 at 05:38:11PM -0800, Daniel Walker wrote:
> > Rob Herring has complained about this section of code. I removed the
> > command line handling code to the cmdline.h header. This hopefully make=
s
> > it easier for Rob to maintain it (at least he doesn't have to look at i=
t
> > directly anymore).
>=20
> Well, my goal is to eliminate drivers/of/, but no.
>=20
> > I would like to add a Kconfig option called
> > OF_DEPRECATED_CMDLINE which an architecture would set if it uses this c=
ode.
>=20
> Which architecture needs this code? Do we wait and see who complains=20
> their platform broke and then go set this option? In the meantime, new=20
> platforms started depending on the new behavior and setting the option=20
> may break them. So we can't have a kconfig option.
=20
 I think you misunderstood the comments. The objective is,

 1) Remove the code in drivers/of/
 2) Remove platform specific command line handling

> > This would allow a platform to use the cmdline.h and the added function
> > directly and remove the Kconfig option. This change would be in a subse=
quent
> > patch.
>=20
> Per platform code handling the cmdline is completely the wrong=20
> direction. Per arch behavior is bad enough.

This code unifies the handling into generic code outside drivers/of/ .

Daniel=
