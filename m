Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6625D6A14AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 02:48:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNCV66xHTz3ckZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 12:48:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Y8l/K1ZH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y/GBv2tV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=Y8l/K1ZH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y/GBv2tV;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNCT84vJVz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 12:47:54 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NHxKiv025568;
	Fri, 24 Feb 2023 01:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=OR7vH05BoMyy4s3+urpNkGuZ+yc8S+CrwVuEXadbQgA=;
 b=Y8l/K1ZHedodX+e9ZnImuqFWikOFj1e5scvxXysKAUDDCi4z9TsJZSsO9vk6EuqUapAx
 7z30MVhH4zYDZ327MHHN2ka2qPV/D6QQnRMyNtJF74Cn11GMvTFfZwa6MJ8RjlXEZcS4
 j0jp0AFUife0h95iuYTDfs9Tnkg0bi1Xav2DFPLF36Bmm68fZ2V1yE2RaBYUnx5G3mQu
 I7J1rJDfH5dcIkpvoLGR7NyATL+DujHnp56qX3YmhSWAUeLi7GZUU1P3ISeDb9dhGSyo
 AnCFnDbkKZ2f8dxrJ6QH6vX/zLGrndoeWnsng1E234kGxBZXjDVWCHS6Dn+7vhA+dX0P zw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntq7ukxcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Feb 2023 01:46:45 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31O0ekGq018014;
	Fri, 24 Feb 2023 01:46:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn494rr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Feb 2023 01:46:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsQIEEASDFjloHm6nL2L23+ke5qbUB8a0oSIk6ESXMR3IeQcrxTKpSPrBoeB6IiXMGIkLYH2YWTA/1fSE3PLn9ypUNebwlcP2578ZigvV9QBLQErTn6dYuHCTSWNAb03mdOiFKsIO9VlkOpRpoW9eXtb+JCL9MuXKraaWw4driKFaNJsyefNjakl+uJvXbgElIo+G7WDWxuS3x1ppL3r6mMhSk34DJgGOTG4BNHqPmI1Qfsabtz4dryznGP7YKdeUpwPoTx2JZpH0mOAjyvWrqAptPyQOL8IB9CMA9w0nInN3BB+bhZAbjdFxZp4bUHADIG858gK6LWF81GjmZBcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR7vH05BoMyy4s3+urpNkGuZ+yc8S+CrwVuEXadbQgA=;
 b=ZGeRRUvftCxTjh+VPVZmQEYZv33HZYP7Rdnco1Qgum7793nTteeADVSfPktUvG0lLDukbXU+PXgdTQIE6KhERXEJaI+qfRLwkXyppsBaxPQuIF+L3r16Vba9Dv3ancNwB5uxN1EGzchkDP7kxWRV3S7bIv6oCXew3JJ9lVoIr1UYPh/3b7rPj6JHDKIHqrQpuFm+VV/+fwwAC0dQYkuTCqFljqU0Tgjd66byS5AeFSSZ4trH8ebRXR14GbRYTXPOOSnWTGJhMj2ytdAlnOxXs0lCQocqZsHU1kdPn1+ZO3/4QFnRrOebPjU8IJh1hGSgy59yZdRL2aWfkuYgz4tEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR7vH05BoMyy4s3+urpNkGuZ+yc8S+CrwVuEXadbQgA=;
 b=y/GBv2tVbi+QD3aZB0PEAqXVb/jNumQ2K4jGX6Y7eT38W40PWF91L7lPN+v0SapqSfFbESSf9D0UIlDXpOCqBUxvcgfd+kOp5U9Xbhkt0lo0FuoQ3/G2uP43MpBiQ5NeTxc5/3BCBX62bYi0E9JFdZRwNzJt54yRpRv5uGM/ROk=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DS7PR10MB7297.namprd10.prod.outlook.com (2603:10b6:8:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Fri, 24 Feb
 2023 01:46:31 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Fri, 24 Feb 2023
 01:46:30 +0000
Date: Thu, 23 Feb 2023 20:46:24 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
Message-ID: <20230224014624.gnirnx625ylhoevb@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net,
	dave@stgolabs.net, willy@infradead.org, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
	will@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	rppt@kernel.org, jannh@google.com, shakeelb@google.com,
	tatashin@google.com, edumazet@google.com, gthelen@google.com,
	gurua@google.com, arjunroy@google.com, soheil@google.com,
	leewalsh@google.com, posk@google.com, michalechner92@googlemail.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-18-surenb@google.com>
 <20230223202011.dahh6cidqxhzoxne@revolver>
 <20230223202844.noant5suylne3dnh@revolver>
 <CAJuCfpE3YtSQuXJwOYWKe1z9O4GASS9pA_FTWGkdveHb3bcMXA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpE3YtSQuXJwOYWKe1z9O4GASS9pA_FTWGkdveHb3bcMXA@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT2PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::11) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DS7PR10MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a925a7-c976-4a15-988a-08db1608f366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+frDmNW1smhZDOvAn4y4Cc30UnDurbHG0hrKrGsTXH0YPjnsadkFtcq1ILTTIHXnI/fd+DxT1tln9DvXRdfR1KDYGlw11LjLfBSq7NXd5rRCI8JXkBkwf+cyW63U8wN+arj3fxG7QppfnB3skoKSgbPJANFMdEDCxisL1KCrD5KFVXO2rtQu0PmF+56+a3uVcRUFHjFBI1SN4x8/XjCtMftvkewKEZuOCvZSYvfHtU0D1mmiuprN4yHkpu3MFNUtq/zSH2Z2SryirewMFOBewL5bGk4B9ydnIGf9MeBdEYtL+S0xD5NO1JY7brRsAHEp5wDt0tVuK8o9c7RSELDx4Q2z8KrtLqTxiZvumoIsjIHJros88m6d9nXpNBWd26AbXwj/H7cEzYoIPvhFCOuiZl+W04flME1a2YOfrSAlp6bvdz1X69N078W4CHRst6Phy1TueX9zIA+geMH6tIXv/4TIMmZbcRqIzrL8mVLqgh6DeFp46jeMpiu9eWB94cafMpEph8ufT9R6F1fYl3bAgJcC7Z7z1SVHmsmk/VKpWYfPeqCvCkYR3oaTz1nbIQ2GgTm/m3wv3ffMZkICvsov1FrZy5+SjB7eDj7nUWM60uOH9ygzmskPOvMZrq/oaCrsRB9mq4m+bv51qjqfkFy8lw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(83380400001)(33716001)(38100700002)(86362001)(5660300002)(478600001)(7406005)(7416002)(2906002)(6486002)(66476007)(66556008)(4326008)(6916009)(66946007)(8676002)(8936002)(316002)(41300700001)(6506007)(1076003)(53546011)(6666004)(186003)(66899018)(6512007)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?s2EG115+xomNOnGfunJTlRD4gJEQOqD9WcFJZ1z9A76dmkyBlk2Dk/bBiH4o?=
 =?us-ascii?Q?f0W3m6TZ6evjgNVqlUn0EkqcBvnOprXS+rnlYC+UyaP+JpZTm/mGONGEliQC?=
 =?us-ascii?Q?Gin8Hz10T/+k0w89QvEcFQxxNFyNDFNMb8QOpQHqmVCuL2C4eDCzHHvXE7jp?=
 =?us-ascii?Q?6iGAu4lD5ihK6AWri+7l30UxpocMqUJvrnye8n3+CMP4ufaNqSvIoWSLZRMV?=
 =?us-ascii?Q?6vK6g0Mb6llWx2jsNA3M4p5T/YCgz5qYR6/CAfznTJhFyjhds0di1CnQLefo?=
 =?us-ascii?Q?ivHkhDllxbZEiYqQxdcpRn7nx/0Ta0BW7v4T/q0nF6QOcmjrB7YPHjAajj9G?=
 =?us-ascii?Q?U87IvP3WQ2mxQC3MKMEwB7fzJN7ENfZ7lQ2I1xRalheWpwiP/ufgxgeAOrVp?=
 =?us-ascii?Q?vIavIqzaS+pBMaoRkjgVsCRdMGCx841bynsTCpmoK15WieOfJWOvYBMjQWBi?=
 =?us-ascii?Q?CODnmka+ICXQnWFXa3rMuBSj7DdrnkfE83ioG0B0hsJOUMtYb6sO8ZnAaNUw?=
 =?us-ascii?Q?VVJ674Jt0SoLhiBWjwp60Mg2rbCYXpFzsbWTlpNIXeF6ZOqkVx5fIGgjOzT4?=
 =?us-ascii?Q?J23dIDdvvdrBQ6SqGmCYRMLRWyxBH1jVSKwk1VsIl2LgWnZ8gLFk0cl0inGO?=
 =?us-ascii?Q?XT/mYNWVNbEOm0Flp2w2jiILEB23svEeJWF1axP6GXLx+CcwGH4CJRc1zij1?=
 =?us-ascii?Q?nVogyrqqdbQ+dO1tlARHdxzZuycmC/cCBQ8r5MNyX/+7NGalqBsH3w1PKl04?=
 =?us-ascii?Q?w8f6fayQS0pDDLceSLB+QtirrpC2lwLsj5WtEcnasEt7iiMRmQt10EpIa2Dp?=
 =?us-ascii?Q?+Com4V7JL+k7/j/cttFhKIUcOT2RsUE17adw38Yri1NEZriiwJDKuEbS7uXg?=
 =?us-ascii?Q?PFUSjuhxL/vyKGZThwWgMRJjc8RRqF4tx1S2evZM3uXuMM2tCRYYSL2FH4hK?=
 =?us-ascii?Q?y8w0Za58oPz+4I/mo20rnjAumGp9hYV6ugVy6GH9Sonx4rk5jxUuOH0RtE6E?=
 =?us-ascii?Q?p+HPmP5tCxJcZFpOQtpuWeB+KlrT91gpIJVH4YZHIRIyhNMpci0tDQ7VEkRp?=
 =?us-ascii?Q?SMmaOu7GkiOXZlBzEtuKoGapjXMsR9kSbxO6mdJeV7GuWq7aOtQXyuj1liYJ?=
 =?us-ascii?Q?axyK+mQrN4nLZN9tTnd8nQkUrtzrkSAZqsScN0hKD9widL9jJ5DkUnXDYlzQ?=
 =?us-ascii?Q?CPZFxEA8IIE7aRYrXEc237zgMfgdiwbpa3SlqWeCZ1TMeSlkkGDfZ7sKyhto?=
 =?us-ascii?Q?x3aHzxiJb7IADsTBaPqxtRj3/+JjeQ8jDYPbqSWo/8ySvGlpd/7xLMSs6PF4?=
 =?us-ascii?Q?ELKzqUPaw8VQJUFc8AdC3tPzX5oSRVWy5YtPov2V34eHSEEOTUVZZ+eV5jox?=
 =?us-ascii?Q?nbo7yd7sAtv6nRG7hcYwt+ian++aSQ5Bwpm6ervB5X0kRfTICFBFIE/ubXOm?=
 =?us-ascii?Q?4gwGqGuPL4qxAkgrhwIzQPNBL3/ITt4ROL4Iutce1RAd0gf/kixvswltQ7xS?=
 =?us-ascii?Q?j2YAZU2X1/f3IKKGP33aQ1/uepUVTOFpAlbCKV40H8RH66FWI+YHn0XFmfF7?=
 =?us-ascii?Q?x25FwA9LVPW0OKdGnpNqRMnRk1iEaYUtfoM8pUY9OsUin1iW8z+oYdmjtF+x?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?EowdTRyo53GOVcf+fItQnKmSWX4BCfM461zGijwI/CRvesCHYpTJZnslz936?=
 =?us-ascii?Q?4L3VkrllRwCya2HdH1Z4XayjOdF7sKQY/C9C7gJgVB4+EuwDqeLy6Myxj5KK?=
 =?us-ascii?Q?H7DuKbvrfrCnnN7nL+dRixXsy69juOmdpwvXZN2gTgALD3Nl0/SOd2oKf+Rj?=
 =?us-ascii?Q?OfHN91bsf63nDz5NcDRW/AmSQMCVo7nYBxUCAyAWhVkqqSv/jhvHj7R6/E3x?=
 =?us-ascii?Q?8s69HpqIXWtylgON0g1Lp3pYWqZCyBMMBsZ6caPwH+CHH4Id+wwf9HjPmLva?=
 =?us-ascii?Q?4SS02ujjwdo/tBq2avr1KqWQCXR8pHAttuRtQnSWFKtMWsFV3taTEV1jViIm?=
 =?us-ascii?Q?HciGZfZXiK9pJ5c1Ingh+rfKsQ0L9kJX8gsCYEMeYkAOBT7THCjFAWrY1ygO?=
 =?us-ascii?Q?SQgvw02cDzlXK2qzFGQpS4sm3HfNdcQtgwua5BPHbU/K41FQ2qSUZFIz1AMD?=
 =?us-ascii?Q?FaQ8Zq7IkDpQXmhbOQ0uq5lV4E9sQjjl/fNFYKK6fLGozIoQS6WUmi+RbaBy?=
 =?us-ascii?Q?6QCUT3n50+Ze/eh7Ry8qldqSUofhQ7dXUxmrd+oFKheJxC8MahoVe+1gtakg?=
 =?us-ascii?Q?UnCzX4CxeVLJejNvj96KRUJvF/2PtEsRMwSh6FlxCQrwgpWki2jCEASrjWur?=
 =?us-ascii?Q?kgRUiQ3Fq12Rxn2GEGIBteqssUG+DdISUCCX3c9hpMRlkWcjVXfz9zRfGj1A?=
 =?us-ascii?Q?cSA+q9AanKbYKiWzEXcuOmrJg6E+B/JYOB9ojxa+2BZ1fIa8/ziovadEjl2B?=
 =?us-ascii?Q?AbJooZTa3aCDEx7gRBnvwONtiTKq+FzV25AA/vZNn/zELPCeofhQtUf+Vi+Z?=
 =?us-ascii?Q?Tyc8zC2+/Swo2LB2+oQkejV8rLhx9ZCxq0abuqm9kQyiJC/mHRmerBNhSfrG?=
 =?us-ascii?Q?wAM6OGNjAagKt1Angn4Ga1zFiMfP347yYSgBfKuUPGGRCJOBCPW8y4x+berZ?=
 =?us-ascii?Q?u4FoaAkJSYeTyzf7hOaeJQVOd2TDW6ZvX0nmuP176N1sFi0PTEej9kBfmO05?=
 =?us-ascii?Q?NkwIpXfx+M7bJTLoi/5pEqP2w8et44L2bTaNS3Glx7SCSAj6GkJcUfpBa5vM?=
 =?us-ascii?Q?/FGPbvHlbCMLUll7ydTygky9dndYPZHzWq7gQrt/GF9cWgB91DFxVpSYqXNG?=
 =?us-ascii?Q?zZp5Ag0Mz3SCGZ9+NdrX8jNhIZdPMa8jv97O1VBhrHYydj/5bcr2iBaTTe2h?=
 =?us-ascii?Q?vpuVcUR1c7/t1YVKjEn9hgudgG+M0ftd34pXP4yivnU3HLzGaR4QGlB24z59?=
 =?us-ascii?Q?rnOIFk3CI1fWTQ63iBcemVCM2gwoiu2LngtiIla9zC1Wsl/RTa4qfMo6O9z+?=
 =?us-ascii?Q?aMRHibg18z22rb7sAKkTNIA5TmualvTa5wvMbSdGPRrZ0TsUmdzvlX1dpwBU?=
 =?us-ascii?Q?rA8KPhu5j4kR36vkV3CpX9nbCrW6w4ULg4wuDirQRXJo+PAcF+rQ6g3AE3I6?=
 =?us-ascii?Q?Y4ocw2jPYNnsdTrqmc5sS/u4C0Bc8FVAvTABexJK7ut2E+klYOy4brYBq2gC?=
 =?us-ascii?Q?zeWYRjJsOaTa6wyXU95gcb+L9ZLZZmXVkk6397BksX5BFMd2EARNF6+dhA?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a925a7-c976-4a15-988a-08db1608f366
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 01:46:30.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLy5rUvEkb0wDV44TUgDpeFVJ4aKl4Y7MRyDUrlE0AxA0xVN5f9fWNKx344H6HqKXqjjjFFcTY8dst1VrcWLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7297
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_15,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240010
X-Proofpoint-GUID: 2ef1fPhMmlpsWJCxP0WDwKBJox718Guk
X-Proofpoint-ORIG-GUID: 2ef1fPhMmlpsWJCxP0WDwKBJox718Guk
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.c
 om, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Suren Baghdasaryan <surenb@google.com> [230223 16:16]:
> On Thu, Feb 23, 2023 at 12:28 PM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> >
> > Wait, I figured a better place to do this.
> >
> > init_multi_vma_prep() should vma_start_write() on any VMA that is passed
> > in.. that we we catch any modifications here & in vma_merge(), which I
> > think is missed in this patch set?
> 
> Hmm. That looks like a good idea but in that case, why not do the
> locking inside vma_prepare() itself? From the description of that
> function it sounds like it was designed to acquire locks before VMA
> modifications, so would be the ideal location for doing that. WDYT?

That might be even better.  I think it will result in even less code.

There is also a vma_complete() which might work to call
vma_end_write_all() as well?

> The only concern is vma_adjust_trans_huge() being called before
> vma_prepare() but I *think* that's safe because
> vma_adjust_trans_huge() does its modifications after acquiring PTL
> lock, which page fault handlers also have to take. Does that sound
> right?

I am not sure.  We are certainly safe the way it is, and the PTL has to
be safe for concurrent faults.. but this could alter the walk to a page
table while that walk is occurring and I don't think that happens today.

It might be best to leave the locking order the way you have it, unless
someone can tell us it's safe?

We could pass through the three extra variables that are needed to move
the vma_adjust_trans_huge() call within that function as well?  This
would have the added benefit of having all locking grouped in the one
location, but the argument list would be getting long, however we could
use the struct.

remove & remove2 should be be detached in vma_prepare() or
vma_complete() as well?

> 
> >
> >
> > * Liam R. Howlett <Liam.Howlett@Oracle.com> [230223 15:20]:
> > > Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > > > vma_expand and vma_shrink change VMA boundaries. Expansion might also
> > > > result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
> > > > concurrent page faults.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  mm/mmap.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > index ec2f8d0af280..f079e5bbcd57 100644
> > > > --- a/mm/mmap.c
> > > > +++ b/mm/mmap.c
> > > > @@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > >             ret = dup_anon_vma(vma, next);
> > > >             if (ret)
> > > >                     return ret;
> > > > +
> > > > +           /* Lock the VMA  before removing it */
> > > > +           vma_start_write(next);
> > > >     }
> > > >
> > > >     init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
> > > > @@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > >     if (vma_iter_prealloc(vmi))
> > > >             goto nomem;
> > > >
> > > > +   vma_start_write(vma);
> > > >     vma_adjust_trans_huge(vma, start, end, 0);
> > > >     /* VMA iterator points to previous, so set to start if necessary */
> > > >     if (vma_iter_addr(vmi) != start)
> > > > @@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > >     if (vma_iter_prealloc(vmi))
> > > >             return -ENOMEM;
> > > >
> > > > +   vma_start_write(vma);
> > > >     init_vma_prep(&vp, vma);
> > > >     vma_adjust_trans_huge(vma, start, end, 0);
> > > >     vma_prepare(&vp);
> > > > --
> > > > 2.39.1
> > > >
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
