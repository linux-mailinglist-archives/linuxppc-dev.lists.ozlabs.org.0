Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F36D924F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 11:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsbL60dQlz2x9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 19:09:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=eB2MReyp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hHCQe9EE;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ldIZkLcx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=synopsys.com (client-ip=148.163.156.19; helo=mx0a-00230701.pphosted.com; envelope-from=shahab.vahedi@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=eB2MReyp;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=hHCQe9EE;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ldIZkLcx;
	dkim-atps=neutral
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsbK82R2bz3cKn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 19:08:57 +1000 (AEST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3368p3YE011109;
	Thu, 6 Apr 2023 02:08:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Gd2cDNip62Ji14ds4OdoQBlo1z5VlqewCRbyiVCpDNg=;
 b=eB2MReypWcK1+ctba7WH3lOxUPpqvfrfHamccSASd4XErbB5iGRd+mCZeIW7eqYUwTXv
 4gkbHSZk1JwKaHXtKdrxAXuF1o3jtUX63zTMtLC/mf2G3OrVZUREqw1UWpb8RxeixvFt
 rlg6BTSn2NrDE86yDl9Bx2d1gY8wcbQ2uTe4oOKSstatNtE/3WJLS2MdCibENX4XjZhA
 xzWcq1a/3NOR1EN9KH4SYydh4Ljo2d1QsyhR0yaznuHLbqd580lb32GcZ7xEx0J2Qm2e
 vMCNX1Ow/wczPRhT4Ha7v4E151adLpU5Hig4VltsHRzwqzOdak3bl97vzOqiG2aq62BN Vg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkmrs22g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 02:08:33 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17B01C05B1;
	Thu,  6 Apr 2023 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1680772112; bh=Gd2cDNip62Ji14ds4OdoQBlo1z5VlqewCRbyiVCpDNg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hHCQe9EE5vPCy+QfIbZeNMC0iUCPD50BX3tmngIRaZ2h6EZgOSjVHBNYMs8eLDwrP
	 vzfCRrn8noIOky8f1NOykeh1pnqe1iwE9kDJUBeDjopvTh+uvS4EgIcy/Ui/3LTUWl
	 gZOxWs/ZlTGq6hR3WjjzLemSA9QiicFaAexf7qirZ5EcpVgLFaiNsotrx0dDwoXvGJ
	 q7Prxa9NJ6sZqayHMY68QypkTIBFC1bK8Y3b0yHEcErVqhBzNKwJxDSOIdKioRhjsH
	 YltW5v5RzR5esMFJFTFR4psSsoAPxZUtlJ5PdfB3pvMMNxSO01hg983Vikbni6ehyR
	 LCSdp0USajVzg==
Received: from o365relay-in.synopsys.com (us03-o365relay7.synopsys.com [10.4.161.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 94EDDA0073;
	Thu,  6 Apr 2023 09:07:27 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 76E58A10A5;
	Thu,  6 Apr 2023 09:01:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ldIZkLcx";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ1eFJHMY/DH4aKXA/08jlkSGg780mSUuRCUjwRkNBzQLysC6+9Yvpf8PhxJl0JhGwXLfBo1Pd2bwk7DdGuaD4Gjrwho7xk3o31N1ZO0vstO3EeMiwzM2c8GPMQayv0/GN0RzCCZCkRlo26kRbfEJTWMnCdzLBADcyBE6F5K3/UJ/OB/zzq/pZhc2YrLWJW0Vvfe3Ytvg0QqbdgQntSRRsNJoZ7OWcgJXCk7V0KyAWBq35dTiYSQs4R0xytF9Ks1Rt0WHfwOei+bpUWnVaf4Wo2e4t63sQa6nsV2oP+AgmcelYDSReSiJs1qNC+P9qFTq7yDfbydhh06LYkspZ87MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd2cDNip62Ji14ds4OdoQBlo1z5VlqewCRbyiVCpDNg=;
 b=k+Va1emzHPh4RvJhUHpbBVvOeWw+Bn56luo8qOhg9FxzFPdmtIVuISBIOlaGWsV8HVogV9TWEwQt0WjXU9bZaaVBq84WajXzIVD8LZ7L28xdjzVq0rkOXs15BDRIJdxDafVKM96V8jHn+Q4m7+RK72bzYELaq6ERjXAbxgTY4fhvyp/nFlOfkk22aZS1UGjs7xFPlD356QtimL0rI7E5ekykmbxWP8V+wXIJ1DDRQjdUN/FmS81EAytoemILEl0EMOGbyHdXG4Um166q1ly3BuTpFNJdLuKro2zau/hHqm+Y5wHU+dmPshsfyRDj/HulaXNXw5X0mWUtFi7QyhEOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd2cDNip62Ji14ds4OdoQBlo1z5VlqewCRbyiVCpDNg=;
 b=ldIZkLcxPRkjGLN/+/2pAhw1+InAMKNlkCA8Y6E5BfxxY2WBYXLjS8860mR5z4I8cJHX//SVIMLPc7zEnamTHxUZyNvwyiXhEvqUGBpk/N+pBWMPJmedl98rnrfol2tHqTK9ELN+mMDdUeNcfK9asfKwEM2OYkxrnYBkeUh9fI8=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 09:01:16 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6%4]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:01:16 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Vineet Gupta <vgupta@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Thread-Topic: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Thread-Index: AQHZZS+qm3aBT5RvZkOaPbJNwNvoFq8eAmCA
Date: Thu, 6 Apr 2023 09:01:15 +0000
Message-ID: <ba0c6b04-cb7d-87ba-a435-919a910282dd@synopsys.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-14-arnd@kernel.org>
 <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
In-Reply-To: <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|IA0PR12MB7578:EE_
x-ms-office365-filtering-correlation-id: 22efacb0-170a-4f0f-093c-08db367d7a70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NnmimPU9GZ6EYXyazcy8nOgwG+Vt2m+dhgjF0hK6aCH3uNjqXMu/ReiRzsweamhLzfUWH9VPlDsFdp45Y9w48YXJzM05XWRdPz+PS1qARAIuVP1qymKSvvjGX8y8l1xE9jWVr+0By4ym804SNpPv8+QyDUSNkRrs+TgtpwdN9sNXFALWpF3NBdF5HT6SUEAGqanoywKUiHcec/13nLjpZyDzNot4niWW5UxaANoPJS6XeX8CFuYZqYAlHS8co/JM1KjteBxFlbBBiE59arZb94dM+NESal+WihK1DCcxNW2DR5qFabboSSVG7EOY6aIRDvrT8TaC+SvcURLWrPd9Jq4Qo+Nt/y2bhQgdGc7ZQoVGqJR9jHkd9z3ANS9doutBUC9mnEIY5RTh8LxSRux/h+s3FlRrz54d/Vkpjc4oqqbLv5ua3xVk69cIJvAX787zX7ArPoLgh9wzZELYPoQ2id9OaBSjoYlagZoyi/BbpwgzSGvV+KHzu9Z11vLZAVKj5SUb+WY1Fu9J4wAqHNYidciinHRk9PoMGQ65RGNSRxrlsON8ULy6k8h3XOsuVIGHIF/sq4eozfe9Lz5TF9eNmIvYy0MA7PRlRT/04/KSdzylqgqtPYaZmhhcwyClfhCdCXeRSdYbIlB0IucJDW4KuA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(55236004)(66446008)(53546011)(6512007)(26005)(6486002)(966005)(31686004)(6506007)(122000001)(38100700002)(66556008)(91956017)(41300700001)(2616005)(83380400001)(186003)(107886003)(64756008)(66476007)(71200400001)(54906003)(478600001)(110136005)(316002)(86362001)(7406005)(7416002)(31696002)(2906002)(76116006)(66946007)(8676002)(4326008)(8936002)(38070700005)(36756003)(5660300002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RUFJRUxRMlE3NkcraFZVbXRvdjd2MWs1U2orZlg2Z1o0dFlrZmtrNlh2aW9L?=
 =?utf-8?B?dW1TWlZyV3hSNDlIekFlUnRGRDZzK092NmlySUphM2VsTVNhZDZHWjd3OXho?=
 =?utf-8?B?ZDRsZ2JHV0lQdUVOYW14THpGZnoyYy9adTRyYkZ4cWVoNzZaMmZaVk9Xc3BI?=
 =?utf-8?B?YjAxRnRrcW5jWjk4NEhBS0M5RmJac3dUT3E0TFczaHRpSFlzM1l5cHpyU2xp?=
 =?utf-8?B?Y09seEk0VHNOb3pMbkxEbFRTczd6aU40ZWpXWVJmeEN0ZS9FY1I3RkgxLzJr?=
 =?utf-8?B?UWZNOEpRN0FyNWRBVUc1eTVYa1ptd3VKNTNMS3VtajVXbXpncGgwUXRWN0hu?=
 =?utf-8?B?S2k5MlNLZGpnTThLUUY4dDZZdHJrelRsOU1TbUN0V2NUMVlpU1VINUhKY1VR?=
 =?utf-8?B?RFcyVlpYdVBnbUJ5Y1g5YTNYbk1YQThWeTVLem5QUUxmWEIya2c2RmdnK0Rj?=
 =?utf-8?B?T1ZqQSsvaGwyMmlkYVVTQ2FFbXZFbTRESEszSDB3QS9mY1BjMmpnMkpsTVla?=
 =?utf-8?B?STd3MzhWbkNJc3V5Y3ZjbU1KeldrZmRIRzRtUnVNdTJEREVHb1Z4NCtQVEs0?=
 =?utf-8?B?dUdOcDBrM1VOd2dSb0VDWE1pS1pRUmgvSlowSEhycFJZMW5HRml5Y2pJNVNU?=
 =?utf-8?B?bVJTY1kraFl6Mm9SeGhEaWErYWVidTFLbjJ3L2htbEtUZlJFWkdlQVZNRTRH?=
 =?utf-8?B?UlR3Qlc0R0paNnYxamNPMWJweFBoWTVKYk9HNDk2VVJUK1FzMzN0Mkpra0lP?=
 =?utf-8?B?b1RvdzdXUDQrQkxYKzlKcTdrOW13SWFlMXZhSjg2eGt3VjUzUXU4N3czZlBz?=
 =?utf-8?B?YlZ4Zk9WYTIyZ0JES2Y1K0hzR0tVVTQ2TnMxWmIvakZEbHpoTGpVL2FHYkd5?=
 =?utf-8?B?N1ovdDZYTklwOTJUeU9Bck81MDJWSUVKdS8xL1pWTnV5aHNMcWQ1dXFja0Zm?=
 =?utf-8?B?eDE3S085M2RYbEZsSkVuRS9ZMlFMWjA4N3FEeUEvWHhhSzZTd1hqWGt4TWU0?=
 =?utf-8?B?cXRDOUk5MkRwYkUzU2tjL1dVenR6Z0k4MGpYSDJHMUNsOExEamdGZEZMUklB?=
 =?utf-8?B?TmRFMEdWNG1CLzczdkd5aUxQaTcza2VodTBlUmFNMnlhWWhBRysvemR4MTJX?=
 =?utf-8?B?am1Pc2VpMEh1ajE0ei9mYUpubDd4a1k4ZW5sOG9kNlA3KzM4Y25KKzZmTktZ?=
 =?utf-8?B?RlBsK2JVc2VUNWhSekYyclNzYTVlYzVlV0lSSVR0WU8wcHlsVUd3ZW91ZnpM?=
 =?utf-8?B?UFVINHNJTFVWMG12YmRjTDdBRTZmM3pEZmlMWnZsTlJaTFhJUFdXZHYrZXpv?=
 =?utf-8?B?T3hUR0o2R09vNkRDTGUyeDJKSGhReUl5WlhKdHJCOU1ka3p4Z05rVVFxeGZY?=
 =?utf-8?B?VHhHdEtiQTVCRFR5Z21jQXNDRlh2T1ZRWjcxdXlUK21GbHplTnhUME5DRE53?=
 =?utf-8?B?ZjExekY5a1BvdU1mTHpzSWhpbitzQk9vSm1Lc1dOdGZlUEpqczB0YTFzQWhx?=
 =?utf-8?B?c05Dck4wQS9RM0pHRUNNejJvUndhWkt5NnhoeFVOUmFzK3lOK3dQdHB0VnM5?=
 =?utf-8?B?am9jcWxJSDFUY2ZVMWpSSEJyZ0xGV01jK3o1cXV6UjZNNFAwckdGamhwTG5E?=
 =?utf-8?B?YndET0svVFgxRnZ2UWJkait0cjQ1dkZNcHdoWmM4NzBDOWlmRVovcTB0Vy9K?=
 =?utf-8?B?aE0wUFNWOVdYWUFWc01TWE50VmxsRTFWRThnVWM2T0lDcWdPSXBTTEVxbjhP?=
 =?utf-8?B?Y1JhMkxTRE1rZ1hiM3U1M3hKeG5PYktmTWFURzM4Y3VvUXkrQjZKQTF4U3BI?=
 =?utf-8?B?MXZtaExFUUJwWTdlYW5OeUxsNXRrVFdaby9Lb290U1VaZ2IvaE03YkJCSXk5?=
 =?utf-8?B?bHREZFYxRlNpMlU0OTN0Y1VqR08rM3dNaDRSbXZvY0M1Y1Z0cFRKNURmOWZo?=
 =?utf-8?B?V29YbjJaYUVxaGlFL2FxTDhPVS9SMVc4aFp0RHFrbFZodmJCd2NIM1poNEpZ?=
 =?utf-8?B?VHhhUUdQQ2VPbEgzZWttaFVObjc5cGtrU2ZvWGhoTkdkREY4eDBvdlAveVVP?=
 =?utf-8?B?WHRvZDN5SFVMUk9BK0kxMUxOYXRQQ0hwUndEOWhkMG52OWxSV1JScVBoTEk1?=
 =?utf-8?Q?fWBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <449DE09BAE01DB419F0D7A0AFD51E943@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?NWJEbmpDR3pwQTRTb3RQYWM1S2Z2YnJ1L3pLeFUzVzRJQmFBUHRyd0JZMmhX?=
 =?utf-8?B?d1ZlaTkyaGpIMytxVXAxK090N1VVU2dBQ0VOTVlkbUtlb0dYQ3lGUlVZdVFx?=
 =?utf-8?B?NFdMWDZnazJNcHk0TENIL0dGYk90eWRucU1Yem9wdldlWHZ2L1ZxMW5XNUow?=
 =?utf-8?B?TUlxNlNHaXJKdnJVMUgwaEpaRlVSV3YwYnRlejJjVVova2RCejNJQXZxNTBo?=
 =?utf-8?B?aU84VldxRWZaYSsvYUNLL3IxQ2gydHV1QzdWYno5UExQRWY3UUdTcmt4YVlL?=
 =?utf-8?B?MTV3MW43cWpTVHIxbllRdXFRRTluODBwMEhCUzIvLzdaMzR1cDYvd29icU5w?=
 =?utf-8?B?RitvOWMrR2FHZGFya2xCanMweEVTdFU4WElpT1hzZVkwVjNBakk0dnN4SnVW?=
 =?utf-8?B?WU9JTU5FSHhMZ0FTUlZreDZPbUJhNno1VTZBNmtiYmZRWUx6eXcyQ2c5Zy9I?=
 =?utf-8?B?T0tMSHFjVUZpcU41Q0RyUUtIK1JaYzg0NTJMMHdYUkxpV21VQmxzUklmdUVp?=
 =?utf-8?B?MndRT2pIaTY2bEkxT0RsYTZiQTRaOVVjZkdhcnk3Q2c0SGRFeG9FeVJ1TUJZ?=
 =?utf-8?B?Q3FwUUNFM1BWTkdjSWoxaTducEhaNGw1NTdEOHc2NWFGZVVTcms3YU5xVks4?=
 =?utf-8?B?RGdRZlNUK1ZleEhlWnUwU2tZdFZjNVFic2pPK09wYTRxRGVOWjdZd1VsQ0tk?=
 =?utf-8?B?KzBrNTAreTlRVUVUWTl5dHhMTGxtQkxTOEdPenowelN0YUxmWkxWRFJDaTRT?=
 =?utf-8?B?dWpkbW9tTE45ZjM3WStQSDhjQ1FGMzJaYzNKQ2s5d3BDaHhUbi9FTCtNUXBx?=
 =?utf-8?B?alB6K1lSNGN1eVM3NU9VSUhjYkcrc1lmV2pIWnpUU1VoaVN0M3RHdkJSbjdG?=
 =?utf-8?B?bzZPbjJxQ3ZZc25WMFFmUjA3WVRQV1k4RjlOUEZDcDBIRGVVYXZsOGxiY3dz?=
 =?utf-8?B?YmNobXhhRzF6VG90cEZLSmZ4YitMNUtaMkwwaTFKbkdvTEVFK1gvY1FqRCt6?=
 =?utf-8?B?NVVDMlYrTkFHVFB4T0w2UmdhUHJqZU11OXhEWW9zT3M1K0J0Mi9BMTB3ZTR4?=
 =?utf-8?B?dWtCYy9FcUtkcDloQkRMR0FmT0VvZG1HYnhFdTZRenl4M1RiZlJvbXFFZ0ZX?=
 =?utf-8?B?WHJrYnlSaHZsVGYyQ2x5WmYyWU01b1RuVHNKUkdJSndGcVlVNjkwQUdsQTNM?=
 =?utf-8?B?ZTR2MDdITm5TSGs4MkpmdDVodWFPZmVsdmJZQzdmWGxvYStjM1dtdThTNTE5?=
 =?utf-8?B?b3BGK3k4Wjk2M1F1M1RvS0ppS2k5bm4vZC9XVTJIU0lyZlJVZjZ2VE03eHlE?=
 =?utf-8?B?bEd5cGFPUG9reEZKN3F6UVdaeWQvSmxUQzd1NkxtSHdJNXJxaVFMM3Bzelhp?=
 =?utf-8?B?Sk1IaEM1LytkczRhK0lNUktNblFvUXF4TjJaOW5qb2VMZndFdTFVN2FodGxy?=
 =?utf-8?B?M002L01YcGFBc3FDVTA1ZFI0WENZNHdNL1RxaFFGaUc0cVczT0hzRVFMbmJK?=
 =?utf-8?B?UmRqb2xHWmdYUnFBMzdqYW5JbmttNEFTUmZDWjN6QVJnTVU1OVBwd3pqdUla?=
 =?utf-8?B?dHBKNGVFUnBLUnFHazBPZU5ObEd0ZFpLS3F2N0EvTE91QUdzRXlwaXpybFJZ?=
 =?utf-8?B?SlQxUk9qK0RacUZqQXpVSkZwMCt0TVEvK1lMdGNSbWZZRTJ6blJkMDZtUVlE?=
 =?utf-8?B?THBDZXRIR0RKWWVSdFRLMG5aMHZwMnFESXk0d2RiSHdMZFROclFCT1dEcjd4?=
 =?utf-8?B?eFBjeERNdVEwVG1rVk1TazRPdjlBbEJyK1V5NEVRQnlQZUJ2MUN1cUFLbUNC?=
 =?utf-8?B?NExzT1pkYnhNei8vYzl2dDhPRHlJQituY2E5NUhPMEhScVJUUXE2enhkMjdV?=
 =?utf-8?B?eWZHZlluS2FCRnVvd2M2MU5xT25KeEZnbldKZXROK3c1dHVzUVcxK202VVNL?=
 =?utf-8?B?cFBFK0J0cHhCSDU0WjVGSjd1T2J2dmk4aUIvMW0zaDdVYm9XaGRJTGdPd3Ew?=
 =?utf-8?B?ZWR6eVc5MHNsMzVwTkg5dVMwM1dVWDdPV3VzSHVocDNOSDkydFY1V0UxWWlk?=
 =?utf-8?B?ZXJyYTRQZElSSm9Kd3NoMUp4djZkVUl5dmo3Q29MaCtVUk1JekFLUkEzby9m?=
 =?utf-8?B?Z05wRGtUMGpXYTB5U2tHZkpXaUdEeFFvLzNueXBiNUdLTFZkdU81Y0hudDlu?=
 =?utf-8?B?RE9zR0xNMzlkT2dqME1mTENWcm5DYk82Z1lRTmlUYWYrUkFNY2FGc1JiUkI4?=
 =?utf-8?B?NGxUOGFhQmd5QU0yV0Q5SUkvSWk5anAzNWtQYU5pSS9Ud0VQV3A1NWZmYVps?=
 =?utf-8?Q?eiAcpfecQDkpH8VFwz?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22efacb0-170a-4f0f-093c-08db367d7a70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 09:01:15.5598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHTvlNEEQL68pnEq0PaEV19eWv1GbacwWhZLqWw6OJiotK+v/9rDYy7w+gfmgaDZwx2+YikJH1KY4EVsExIU5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578
X-Proofpoint-ORIG-GUID: 2W3pxX1hc2aTZnk8HHvUlrZnKw0I8D-N
X-Proofpoint-GUID: 2W3pxX1hc2aTZnk8HHvUlrZnKw0I8D-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_04,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=890 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304060079
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
Cc: Rich Felker <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shahab Vahedi <Shahab.Vahedi@synopsys
 .com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNC8yLzIzIDA4OjUyLCBWaW5lZXQgR3VwdGEgd3JvdGU6DQo+IENDIFNoYWhhYg0KPiANCj4g
T24gMy8yNy8yMyAxNzo0MywgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4+IEZyb206IEFybmQgQmVy
Z21hbm48YXJuZEBhcm5kYi5kZT4NCj4+DQo+PiBTb21lIGFyY2hpdGVjdHVyZXMgdGhhdCBuZWVk
IHRvIGludmFsaWRhdGUgYnVmZmVycyBhZnRlciBiaWRpcmVjdGlvbmFsDQo+PiBETUEgYmVjYXVz
ZSBvZiBzcGVjdWxhdGl2ZSBwcmVmZXRjaGluZyBvbmx5IGRvIGEgc2ltcGxlciB3cml0ZWJhY2sN
Cj4+IGJlZm9yZSB0aGF0IERNQSwgd2hpbGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IG5lZWQg
dG8gZG8gdGhlIHNlY29uZA0KPj4gaW52YWxpZGF0ZSB0ZW5kIHRvIGhhdmUgYSBjb21iaW5lZCB3
cml0ZWJhY2sraW52YWxpZGF0ZSBiZWZvcmUgdGhlDQo+PiBETUEuDQo+Pg0KPj4gYXJjIGlzIG9u
ZSBvZiB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvZXMgYm90aCwgd2hpY2ggc2VlbXMgdW5uZWNl
c3NhcnkuDQo+Pg0KPj4gQ2hhbmdlIGl0IHRvIGJlaGF2ZSBsaWtlIGFybS9hcm02NC94dGVuc2Eg
aW5zdGVhZCwgYW5kIHVzZSBqdXN0IGENCj4+IHdyaXRlYmFjayBiZWZvcmUgdGhlIERNQSB3aGVu
IHdlIGRvIHRoZSBpbnZhbGlkYXRlIGFmdGVyd2FyZHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubjxhcm5kQGFybmRiLmRlPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFZpbmVldCBH
dXB0YSA8dmd1cHRhQGtlcm5lbC5vcmc+DQo+IA0KPiBTaGFoYWIgY2FuIHlvdSBnaXZlIHRoaXMg
YSBzcGluIG9uIGhzZGsgLSBydW4gZ2xpYmMgdGVzdHN1aXRlIG92ZXIgc3NoDQo+IGFuZCBtYWtl
IHN1cmUgbm90aGluZyBzdHJhbmdlIGhhcHBlbnMuDQo+IA0KPiBUaHgsDQo+IC1WaW5lZXQNCg0K
VGVzdGVkLWJ5OiBTaGFoYWIgVmFoZWRpIDxzaGFoYWJAc3lub3BzeXMuY29tPg0KDQpObyByZWdy
ZXNzaW9uIHdhcyBvYnNlcnZlZCBmb3IgdGhlIEFSQyB0YXJnZXQgYmVmb3JlIGFuZCBhZnRlciBh
cHBseWluZw0KdGhlc2UgMjEgcGF0Y2hlcy4gVGhlIHRlc3QgZW52aXJvbm1lbnQgYW5kIGl0cyBz
dW1tYXJ5IGZvbGxvdy4NCg0KYm9hcmQ6ICBBUkMgSFNESw0KYmFzZTogICByZXBvOiAgIGxpbnV4
LW5leHQNCiAgICAgICAgdGFnOiAgICBuZXh0LTIwMjMwNDAzDQogICAgICAgIGNvbW1pdDogMzFi
ZDM1YjY2MjQ5IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZpbGVzIGZvciAyMDIzMDQwMw0KaG90
Zml4OiBuZXQ6IHN0bW1hYzogY2hlY2sgZndub2RlIGZvciBwaHkgZGV2aWNlIGJlZm9yZSBzY2Fu
bmluZyBmb3IgcGh5IFsxXQ0KZ2xpYmM6ICAyLjM3DQoNClN1bW1hcnkgb2YgdGVzdCByZXN1bHRz
Og0KICAgICAyMCBGQUlMDQogICA0MjI3IFBBU1MNCiAgICAgMzggVU5TVVBQT1JURUQNCiAgICAg
MTYgWEZBSUwNCiAgICAgIDIgWFBBU1MNCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjMwNDA1MDkzOTQ1LjM1NDk0OTEtMS1taWNoYWVsLndlaS5ob25nLnNpdEBpbnRlbC5j
b20vI3INCg0KLS0gDQpTaGFoYWINCg0K
