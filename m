Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F846D5BAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 11:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrMbv6kcjz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 19:17:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=a7kqVGSr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GPFoyRAI;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=S4Vd5tYg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=synopsys.com (client-ip=148.163.156.19; helo=mx0a-00230701.pphosted.com; envelope-from=shahab.vahedi@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=a7kqVGSr;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=GPFoyRAI;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=S4Vd5tYg;
	dkim-atps=neutral
X-Greylist: delayed 2814 seconds by postgrey-1.36 at boromir; Tue, 04 Apr 2023 19:16:40 AEST
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrMZw3fQcz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 19:16:37 +1000 (AEST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3348LuHR027768;
	Tue, 4 Apr 2023 01:28:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=94yBqneQ9Lj342QeW9TDCvZXFWBiR0sn8rxyuOp0TBc=;
 b=a7kqVGSrGtvl9HpnkoTThRciRdt+crJz2OXCnWJ0XV8ViQz14hFGDo7TGiTXb8xQWgIt
 3/bMr4nQ9w0nW5x+w07eTH19g2OHnnqqg5U1gBm+1eRz3GBRklqQL00GRGHSulM+PXET
 uWfAvGd5FBHLsXOHIchy8Aohivg7LTnyM/uBn1SDQWYvwK/mwFcD9cF7OJn0LyBIxV2A
 3ds1+c01N6QEBd0oYnaFzLy3jfVxpb9rcP0qQ8dUCC80ZvxoqycugLn2jNG46EUDbHyM
 oWCh7NXZgOZcIKgbhFkndrV7VoUb1LCSb6Vdy8Za22pjtpx1l/4JVaKy7Wczlr1ZD6XR 8g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkmrc25u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 01:28:01 -0700
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E7174014D;
	Tue,  4 Apr 2023 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1680596868; bh=94yBqneQ9Lj342QeW9TDCvZXFWBiR0sn8rxyuOp0TBc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GPFoyRAIHf7LjB9oRkoCPh7YfXuW004CD4F2kq/F6Vdv2ntMVJTQPiOMsLKFUBqAr
	 WAQ6vU73eVocQtlrPtBU2metNIJZJGgZdnPR6FTRh7fYisM9NSrsgJ0Ma77EjnjnvS
	 Iy+m5jd/LFqkuuOON0bsrF8ewng08UPBH1tKUT/tkv7PVPvc6HiplNA70nXcuDV32V
	 0yUTOssIJbcQlxOUp6QT3vtbVCyCXN7LWuIrLmrF42SaaUgkyp4U0ZkUlu3IruDKhV
	 LB3oHKrkurdPe7Xcb+jqt+TAaVkpQm1aVEdn1W12zz39Dv0mpzQDop2jfRQGRoKgqq
	 hnftEGnW5To+A==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 90AC3A0062;
	Tue,  4 Apr 2023 08:27:20 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 405B5400B9;
	Tue,  4 Apr 2023 08:27:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="S4Vd5tYg";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4wfEVIisEqQtrAtE9gQxJHml+T2OYw2foDoMl94xLqWuGOyNL+ocSeAMHn0fAlDlYxePrHW9pRrHVN1TcCb3IYIpcgjaLkTJykDC6NT/X15o8jcf19des7SelW05Eujjp8NO7G+YDhXDYEIaIFj2wrIJYd+sQtbLgofCoCcmpI7AF3AYBJctRtNs9EKB9jfoT9A4fPk0BG1SXKhUnbDrGBDlmXgPHtNvGS+Lm6Hqt7v3dDLDF1ytnD/SuWqmxWVn0UoModmqSW0oOwHhS4ozyI7e02alyg1O+WnPk5GO7/2I01z0T9CwZ8fp98yVa/5WpJ1h8NDRuig3sbNO0l03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94yBqneQ9Lj342QeW9TDCvZXFWBiR0sn8rxyuOp0TBc=;
 b=kABLGZRGEg8VrXpq0q+XMezkQm4HQd/Q57QEqdbSff1BXGPp9+tChMTfTHOHqP/ZBgVpkyRdORTjiKvdSG8QpG8yXr/1sLRhpoQdRVmfdSmgJUl9kCkkrxYywCVHiAEZr3memfDhwyNwSZTl4JQa49cKWiTZYSIHRN5pY+ZivrKeRk5QmkKIaJZp+W29vLh/bWrgaLXrJ8F8H0J1B4AbNx1zIy90DlViwsNq9BkJtfQYGlS7kz5jizMPV6kKexYq9YXJQ5buRGLhaLIcAzMEvIT4CyagIiPxDIvkGqhaAgwj6tAB8i8zzKexe7OX1MK0Msb50NXQxuT14OQnDUu0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94yBqneQ9Lj342QeW9TDCvZXFWBiR0sn8rxyuOp0TBc=;
 b=S4Vd5tYgdcrXzOQ3bEgFj+/IfpPK7in4gr0tMFqxld8FtkVDWIMnqStvA34RTxtvHI06mX9BwCcA/7W5r5lG01Vswzj5DzeYMFWLnfj5prbrPnSersMZdGJzfLBHHZLfiEqMhxG+0JCQg6MA1UdSKZNObVrmIeTR0nuYUC/Ww1k=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 08:27:08 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::16ef:a4:a1eb:6c6%4]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 08:27:08 +0000
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: Vineet Gupta <vgupta@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Thread-Topic: [PATCH 13/21] arc: dma-mapping: skip invalidating before
 bidirectional DMA
Thread-Index: AQHZZS+qm3aBT5RvZkOaPbJNwNvoFq8a1C2A
Date: Tue, 4 Apr 2023 08:27:08 +0000
Message-ID: <44b1ee5f-399d-9c3d-b050-02b2dea249be@synopsys.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-14-arnd@kernel.org>
 <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
In-Reply-To: <2b298e8c-e6fc-a973-9f42-b6a88e92838a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|DM4PR12MB5986:EE_
x-ms-office365-filtering-correlation-id: 7740b98b-4b71-485e-060d-08db34e66170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  40Sy04XWhxB0Li3ymCIAmWhYXX0tPd/5YmRJB76hJL6KUjkEKXCR1RzeGo8u5L577+b879qkGwe0CiHPfm91doeuuH50yMDMu4CV8WQibv5sjqJI2pQHbMxQbp8/5s3zMtshE/Q98+ooDGBCE90ROoUcNnFfMZp9XJFTeG6goflhbbiTNIth4Hy4YIBtLZJoo9zQ56Ye1o2w2Aso24LfK6TVjms6ccz9q37B38C6xwLgf5Ohg5tLYPrxu5romOLiVScRXCjyK19vgPkxI/7hlpxHsMS9fMxCdOCxa0w7fegkSnDMtWsntcsP6yFikBui8ml3UmKMIN9SU+9e99BVu8OQ3UXhlMhRQEiQVMrU8mKpAIPS1s3KjV7h/znMLSCzunhFvZ0SAtgn3jhccuyp9zSKAQpNKxJJc2mvZMncbbdhAYJ+9iMK3n8CsZesJ58X1sATi9B04OInoE0dh//qxTAbu48Nddbdwax0Q6cWuNdQBmlPPf85arEkl4D2aMTOlBgX5UnjMBsac7GFQhgUXg0oMnJ98/JvDTFiDBT+7jxtHtazmVdkZsvwLfxQX93Qowd1MBaLeoM6Wmm35S4ZXn4YmdwsDU57bNiXd7c+DtSbzZgY7G3mCjs8zL8pjIptlY1spYEBrryHe1M6TAxm0Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2782.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199021)(6486002)(55236004)(122000001)(6512007)(53546011)(83380400001)(6506007)(38100700002)(2616005)(186003)(107886003)(26005)(4744005)(2906002)(8936002)(5660300002)(7406005)(7416002)(36756003)(478600001)(71200400001)(38070700005)(54906003)(66476007)(64756008)(4326008)(31696002)(66446008)(66556008)(66946007)(110136005)(41300700001)(76116006)(8676002)(316002)(91956017)(86362001)(31686004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S0swVTNEZHE5V1J0Nk14ck56c1A3NWpEUWIvMm5zR2xIa2VSZVBGdkszeFhK?=
 =?utf-8?B?Tjl3K0RMVFhqYmVDallNTzhpaDlRT29mUWNmQTI0Qk5aRFpPMFVYU2VpN21X?=
 =?utf-8?B?MEpBWUtQNzVXQlhvYXhESU9aT2xJZFlCZHM1TjdBNTY0R2xod01PYTgzZmFQ?=
 =?utf-8?B?RzBWTk9ONW9OaHpkaWp4QlBXWVF1cXNzRDY3UTZNbHRMT0FjLzJ2MWNhVjBI?=
 =?utf-8?B?TFpPMlJ4RzNySVh2RjBiYlllcEhMNHJQOTl3UnBnVEh4T3B1OVh6a0FOMjhk?=
 =?utf-8?B?eFpiRlo2TE5rbU9FZ0J4R0ZobU5XRHlsaHpHMGRPNSs3VWpmYkxxdTJVVmY1?=
 =?utf-8?B?dEFEb3p6ekU0THYxTkRHYmREc2toT3Q5UW1lK0hUQUd1VzJKV25qSjUrQ0NP?=
 =?utf-8?B?dU5lUEZwWHhYNm1BcUs5R0orbTlHam9rZXJPZnplaUd6QTdUMGw5T282cm1o?=
 =?utf-8?B?ZFZvTnRzd1V3VmM5Ym15aFU5MWd3cDlYNDdHbys2cUhEaFFaQ3owMnVBZzdt?=
 =?utf-8?B?MEJBN25JNXJZdno5L3ZTNzdwMXNPZmZja0Mrbk10UFVYWk5IM1o5WHczbEpR?=
 =?utf-8?B?ZnVpZGd3QzUzOS95SHRKTldsSmVjWmJNOGpaR2plOFN0T2V2NEFNaG40WWdI?=
 =?utf-8?B?TE83N1hvSytLK05QWXhwanV2U0pBVzlyZzM2YXpqZEZ1L05PWDUrUXZlY3Bq?=
 =?utf-8?B?VitRdnFUTTFVZ0t5TWpqN1dwcFRVZW15c3Y5azZTVzVhZHRwSVVLUElaUit3?=
 =?utf-8?B?QXdVeHNpcUExcUNZM3NVMlZiVkNWWHIrSEdRUjZnUjQzU2RHWHE2YmlSKzBP?=
 =?utf-8?B?U2tadTNGZjVrdVNRUGQwaytJa2d3bFljbnkxTDJzOE1jZGxrTW5DSjlUVUNV?=
 =?utf-8?B?NDkyQUVYOHRRZDNvK2JOcGdMTE10NC9sWDlEczFidThVcnkxVTEycDFIWldz?=
 =?utf-8?B?SmxUdUFCb1lrb0pKTE5rTG9ZaU9ueWw3WHpFYTdteUVWd3QrSkxrRlF6TEpq?=
 =?utf-8?B?bGZBTnR5V1NuWm9kRXJQS2wwTmRZWi9LdXJ4WHNXV1FhcEkrZTFFN3E2d25p?=
 =?utf-8?B?bWpXODdkeXdsQVVjYWFQN0VJQm4xenQ0RllENVZCb3FwdG1PYldEUnlxV1Q2?=
 =?utf-8?B?MkJicHlyN3AzcVFtY2tZVVpGQlg2eWZ6WnlBVzBHUEk4RWtkOGwrdnE5dEZh?=
 =?utf-8?B?c250OGoyeUZ2M2M5dWZKRVpZRjhHYUdaTkwyZXVDMU5OUy9oaUJCNEYwLzdY?=
 =?utf-8?B?RlA5a215VjJ4QVBJbDkvb0pTLzF1TlI5NU81bjNOOUVmcW8yQzZyT1I0ZW8y?=
 =?utf-8?B?cVlsSFBZWWoyZG5FaVBHTUJCKzJPN0tIY25HdTd3b0RHK1hHOStOUnh1RG0z?=
 =?utf-8?B?SzUyOUh0NTZ5QlFWOWtmQmxvdFJxekdFUXlNQ1lRK2hVRTFJNGVZVUdDOEFW?=
 =?utf-8?B?MloxeTd4RldHT2ZqcldzTmtQTmo3UnBBc3NrYnBCTDRLMFJ0NGtVQW9yV0VF?=
 =?utf-8?B?aXRmR1Rrd0NPTzNuejVZeTNPUEw0MDF6dFNKenRwaklqWG55dzhsYXpjY292?=
 =?utf-8?B?b2VvYnFlTmxzUlYvZGRnWlhlZ0JVT2NCWHVkNzgxRkhZOFhUYjVROWJnb2Nu?=
 =?utf-8?B?QndNQ0VrMllNTTByVk9CVUV2MFUxbVl4N1k2V2N0c0FTMDF0YnJuck14NzVT?=
 =?utf-8?B?RjE5VEtxcXZiMFluRWR4dHIvQlZhSzhTT1hCQ1hSWXZDRWR6OHhqRlg1RjJP?=
 =?utf-8?B?Ykw1Z0Z1bGlUbUxUVE96YkdpSnlLcjNZMUI2WExXMzZlSEpBelZac3Vwc0Y5?=
 =?utf-8?B?YjZGVmF3TkZpajN0KzRYVUFYbWplMEF1eStOZkliakJqNGhCQkZHMm01bGxN?=
 =?utf-8?B?M3N5TTQ2SG9sY3N3bXE5UDB6SU1XN2Ztem80S2VMK3dKTGFudjUySUd1TGg4?=
 =?utf-8?B?ZlpTdElUQ3dEUkZPdGxjTGNtQ1RJYUdoRk04QXhpZDdWUTZDOTVCTVRQYjYw?=
 =?utf-8?B?Q1hPVWQ4bE5Qc3RQamkrS2t4MEprUkFGdXhOb3RJWWJ1MVgrU2VaejUrOXdz?=
 =?utf-8?B?THdma3VWYUpRWXl6dXZPeGMzUDVPTC9iR3dnQUNSVmRRVzhQS3p5RXUrWWdP?=
 =?utf-8?Q?oBnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AEF97A884463F49BD330A84DD8259EB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?ZzdHMVdrSDZvc3ZvbHJtWVJFZWE4VC80QklqeDM0Qk42OENta2FXU0k0VVB0?=
 =?utf-8?B?MkhSUEVPMHVVdFM0K2Jmd01XV0hkMnhRaFBWZXFaTnVuZFdZeDJSSFZjU0h0?=
 =?utf-8?B?alRVZE9PSWtNYzlqTStzREdleXExZmp6ZlVLYmdrMWgwN2FJS0JZVzRtWTNw?=
 =?utf-8?B?cDBvMElLbjA1ekRrVlJlUGkvcE83eVozaDZXZG01QnFneDN5QW5mVTdyVW9X?=
 =?utf-8?B?R2Jkc2tkeFZiWmd4VE1tZ0tQSHAzTmRNWWE0K2ZkQ1h6MEFQbEEybUFKUkVB?=
 =?utf-8?B?RHZuTmc2UEE1OEtHTURjM2R5U3hrZ1JTamh2RTBkeDVDZXY3b3liV1VLakls?=
 =?utf-8?B?OUs5S21uMFVsVVR6QnVCcno2UXlwUFEyQzlCbEVtQkQ0aUhmczEvbEx1RVI1?=
 =?utf-8?B?Rm4xNlIrWTBGZUk5eEY5bm03MVlGKzZvS0FTVDdqOVd4dWpySi93eVpUeHNz?=
 =?utf-8?B?bEF4U2pEU29hWVR5Ri9IbitYZmUwUld3ZE9heXdVTXNVTUdhb2x2ZlV4TFgv?=
 =?utf-8?B?NUdWNUU4QWdEOG5WL21JKzZBbGlIc3dtN3ZhQlFsU25QTFlyNFJKWHlOODFT?=
 =?utf-8?B?bHdKdk8yRWNIcHNBKzdIVVVSeThjUlRBT0dxVTlEM2tMeFR4M0JGZjVsWEtz?=
 =?utf-8?B?REkvd2FrVkZ6TDkvMjJHS0t2UWwxVWZ3Q2lQTmF2NjZNM3VhQUJORTllUFpO?=
 =?utf-8?B?TmpSeEF1SSsxS3JzL21oTGVMSjFNa2g5bC9tWERoZjlPeHhLajBKcHlJYXQ3?=
 =?utf-8?B?ZEhGSSs0Z21YQ2hTTE9CZVZKbGRwdXB6K2xNNGZTRnM3ZURsK1VYV3VNdS9p?=
 =?utf-8?B?L1RueWwrNXR1ZDZ3ejFNVTR3QjFRcjZja3RIaFlWL3Zhb1BQRXFWY2RSRENV?=
 =?utf-8?B?dC90V3JtKzZsS3o1eU81OWFXNWJVS0lReFBaVWxaQVMwbGVlbkhyMk5tM2Zy?=
 =?utf-8?B?Mjk4N0JBR2FYd21WNUtCaEVobDZkOEFMYXZIc0ZmYlpPcHZCWHhmQXhwWCtq?=
 =?utf-8?B?QjczWWdLTERvaVNGZnBwT3pqMzdYRS9CYmFMUVJYWUk2WHc2NE9IenF2aUlp?=
 =?utf-8?B?ZWZSL2ZDRW53K0ppdnRLb2tOSGVMY1dSM1grcG00NCswL2VmY2I0L1FQNWRo?=
 =?utf-8?B?bC9peWE0RUdOVWl0OEtFaDdheW1GTUlieXd5cG5xMlZxTllJcmM5QVFUS2Ir?=
 =?utf-8?B?bFB5SnR3WkQzTVRVQUNHN2ZBUkZxYmt6bUxmM202UlphbDVXU0o4UnF2SGhL?=
 =?utf-8?B?R0VNbGFCOWIrWjJ6a3JTeDRnWUZuN2RZQ0hEQ0g2QUtpNENZNURUcjQ3Z1dC?=
 =?utf-8?B?RjhvL0NXOTFxdHF3b0cvK2orcFNFU2RibGw4OTA5UzJldlpaMWpKdmx4N0du?=
 =?utf-8?B?cjAyUmpBZjJvbGVtTlZQc2pjWEFFVHVuV2trb2tPV0hKdW5oZm1IeTBaeG5q?=
 =?utf-8?B?MVRGUzVsa0R6dEgvZFhDZWRhMGJqZTVLZXB1VGNWeW82Y0d4L3FZbWVGK1Js?=
 =?utf-8?B?Nys1blpFcnFoVE1YcVgzTDF2VUlqaFJEeHFtRi9SMDFZbUFPbUVrMkNSKzVy?=
 =?utf-8?B?eTJ6d2xPOTV0ckdVWUtVSW1nTjhXc1ZBWGZqRFJRZllpMkZLYXZETmlCUWV4?=
 =?utf-8?B?dHpwR3F2R0RUcTc1RmhNdytEOU5zalFhU3hPQVBEcUV4RUp1UGsvTDlQMzMz?=
 =?utf-8?B?WEs1aCt5NGpCbDR5WlN3dXFkdDRob09LZ1NRanJSaVJWSGRUOUdNSktPeTNn?=
 =?utf-8?B?d1V0RXpyblIzTUNxT2JIUW5qdG1VZERnbWZwV0lOYzhYc3dQWnpEY1d3bjZG?=
 =?utf-8?B?ejdDR1lzbE5pQStQMmZHcGxyZkhENDhGeUF3dzBqOU15NEhZREdZSStYTjdU?=
 =?utf-8?B?Yk9uM3Fybko3MFlLYWVRUmhsMi9LZStVWXVDMHJrMUhvSTRpcFo5UERTM1c0?=
 =?utf-8?B?SHlYajd5cnF4RVFrVTc5MUJybFcyYk9DRStXZHF1TXpkbmhEZFZ3bnFGLy8w?=
 =?utf-8?B?cWJnUUhQcHFkRVp0K1NTOTZkZWJKYUJvS1VpcTM3UTBEd0JPR0ZZek1OSG5q?=
 =?utf-8?B?c2RHc0Q1aG0xQ1ZUYUx2YmxlZVNRcFE1S3VGUzFNdS9LTG56TlRBVFoxS2lQ?=
 =?utf-8?B?Z2ZGZGVxTk5VRFpGWjlZK3RJZ1VGZHFpU3o3VDJjdGJQUXl6MU9WNlRTMzZL?=
 =?utf-8?B?d1JZYUpJYlpFMTFHbjhUUlBJMDZBRjZSUVdEUmpncG41eldlREpwWWhNNHM0?=
 =?utf-8?B?dlB4Q2E2OGxGOVYrRjBObERtdEZ6QkNSVXlhTE42VEMyZkkzZ0ZiT0VRUWd0?=
 =?utf-8?Q?oL2bLTySK489iDqS4z?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7740b98b-4b71-485e-060d-08db34e66170
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 08:27:08.4302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsTQEbw/ITbvbPUhQRp+mzfA3tQ3kTh0uqUmUmTbI+/tXcFCRIKuFLlkV8mso05SmdevAYn40aJRdL6HhZ7oYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
X-Proofpoint-ORIG-GUID: REra5x0UtIhyLslFsU0vkBiGZ8CM-HcF
X-Proofpoint-GUID: REra5x0UtIhyLslFsU0vkBiGZ8CM-HcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_02,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1011 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=651 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304040078
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
YSBzcGluIG9uIGhzZGsgLSBydW4gZ2xpYmMgdGVzdHN1aXRlIG92ZXIgc3NoIGFuZCBtYWtlIHN1
cmUgbm90aGluZyBzdHJhbmdlIGhhcHBlbnMuDQo+IA0KPiBUaHgsDQo+IC1WaW5lZXQNCg0KT24g
aXQuDQotLSANClNoYWhhYg0KDQo=
