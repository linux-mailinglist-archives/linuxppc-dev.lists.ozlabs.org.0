Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61D69AE6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 15:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJFDP4JTdz3f5g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 01:53:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nvhDIyHP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jBrlY+Gp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nvhDIyHP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jBrlY+Gp;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJFCP4KJMz3cNG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 01:52:15 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7iGwP007518;
	Fri, 17 Feb 2023 14:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=19JWXhSrSNHcv/lIhnR02NMgz8PW6g/yXQ3LsI75OFg=;
 b=nvhDIyHPGMxAiDXXuRZu1YwsjLaEaHfTmvdytZgC5BI5wBBds21UALAx4UJYkRlENjSb
 ytl+MN8mPb+qvJzf21MCyaLai/WWYStENjJlb9OhVXCKIeudI+SNp4Bc5L06SLjEj552
 md02+Zqog7DMj0eGAMdXY+37MYaZGDzvj4LnTLiKqLPHXmjLQ3Xj270VpD3InM/LGdQ9
 dL0jOkYn0lph4DB5kwhlWvMEjWjzU1POcLO0q9fDUsvC3tji35Klzd8sSqLq96KoecX7
 JApbLKUNonSABshbGiUwSgepQMww+9wLgJ/TeAP1XUbWD/DQGefjDWdX1pjGhAD0GGWv jg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m166ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 14:51:03 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31HEJSU7019958;
	Fri, 17 Feb 2023 14:51:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1faqwm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Feb 2023 14:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA4SD5lkyCwI99bWGDr6t9BDxuECqWI6n+NQo/bq/h4Sbq4ntt82RqjTUH5IHP/7kQKq5W9yPxw3AnRonSQlXhGNx0DHg/1sYiYjq+1n/7GCQCcSK59/sI8ehoHr6bt52SxBdBEkhpZuG33VJ3DqPKqRq5IOUIz8U+rcma8Lwt/qTbuMlfsI7QdaYGFIlgm0zXLNayAmQbMhR6hSQyDVXoXTA4QvWr7aP/3kNg2zobbYz9C92lZj31FzhLvDENC9U4VlWwZG5GWz0PFzYXPVkvioqW4gCHPDS9uSKpgsMYbPKjz7uC+eyo9TXpRjm2ZH0D6TQGKNF4UjVUO9aiDVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19JWXhSrSNHcv/lIhnR02NMgz8PW6g/yXQ3LsI75OFg=;
 b=mKYN5rjWHAdOpguYCEgQJd0yYh/sYgP0TfHk0f9azfupT4Uj2mX58xy1MnOwfbLRB0k6FO8iYRVQCEHPRdO32vvoKL5+HO/RHWGI6PVlyhVp2vUAn+PM4m8H202hxUI2Ayqj3Z7wX1AE7JXrztlH8Nkyg+mobiq6OpYEX2Iy3kvNxpvRPnjzvinV6ARo+4SajEZtiJ87i9+6uj9C/RFq9F5bn5MzGxtJfZSXsxUhfOwHe84fAMuvWTCCj/rbErcI/suxhOX7uDTPvywjnktn00pHBoYq3D6XlvNWRqCTLCtApEshprc4jbEj8mYRvzHGgljrqz9gnuUn+R5qdQG8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19JWXhSrSNHcv/lIhnR02NMgz8PW6g/yXQ3LsI75OFg=;
 b=jBrlY+GpBujpwCXYswvP2W5dzsYXiC3tRPvF5oGeyp43HOkzQubVkXjSChZGo/Cv45PL5V726VrUY8OI4ZTeJHIX0OsvKWPVLaj0vrlNZbwn3en6O5LIQpXl1vGvbAfGvs3FxLQi+uLqfOdiwhUthiUoybc2Qt3Flg2YdwgQlLY=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 14:50:58 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.006; Fri, 17 Feb 2023
 14:50:58 +0000
Date: Fri, 17 Feb 2023 09:50:52 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 21/35] mm/mmap: write-lock adjacent VMAs if they can
 grow into unmapped area
Message-ID: <20230217145052.y526nmjudi6t2ael@revolver>
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
 <20230216051750.3125598-22-surenb@google.com>
 <20230216153405.zo4l2lqpnc2agdzg@revolver>
 <CAJuCfpEkujbHNxNWcWr8bmrsMhXGcpDyraOfQaPAcOH=RQPv5A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEkujbHNxNWcWr8bmrsMhXGcpDyraOfQaPAcOH=RQPv5A@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::25) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SA2PR10MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d8a982-ac7f-4c8d-52e0-08db10f66121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VE8F/K4g8r1dqmVho54A8MfWCVoCjMd2KvqliVtjJ51pQCHtTT2hzYOPP84fNMj0mdd413soVCGWxBWO7gTZ5BSwkGzvCtRy4wjdaO73jZ3MYGcO5TNR5ubPgNk7it4dUt6IfXBVTV9TmSG3vvxv8UFyGa3vIpV3KzyUZ/8f2qiPlzglZpIbJ83g8I8jqXPGXcfkwGG1w1cqEupPvpYcQ1VNZdbM5U9QK2n/bbTwAB/bas5wFvCWTMBMwOZe7vM6D/sSK7QjqNfOKMHTF2OOoE+VpYUdAxcYqoO4I/eXSiz0Vi4ZyjPBM2t7rHLFgMABDX6v7+9EQpbqzK7ZWP3UonHrX9PYutXN4xQCqYXi2QR9C0XJrbwjxYyQWauOR6hFIXvW7ScbgPyRlmu7bAUjmD/Ya9SlGZZ8GqZp9HgLtzq6l3VAfZLLI4Fpzh5u5sae87DiVMyvTQn5i6tQGh/+rsejJ4DMWORt1h2ADGxDM0IRgTtIFfE+xsPxtmN/n9rCAARzJJ6DVHtyrPDkDOabfdgy9nNlNH2xTLIT2nVskGt5LsRAPjF5+7uPshx5plOP7MXIfg3JUnVk35Em4l6WowHctofUloQ0a8OYCUfJtdTLmGORJhkMLYsH587yQa4mexNpWcRCjnXKCUjPNHF44A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199018)(6506007)(6486002)(8676002)(8936002)(2906002)(6916009)(66556008)(66946007)(5660300002)(7406005)(4326008)(66476007)(7416002)(86362001)(38100700002)(6666004)(478600001)(316002)(41300700001)(33716001)(1076003)(26005)(9686003)(186003)(6512007)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?l+Hg+brjRuBCZU7F10OMsrSzkiIekQnMNduF+BzypA+H3AuGi9SxeZ0TLFk6?=
 =?us-ascii?Q?lgbaVZGqtL7BKkL8Gt24JV+am9GZr47bx8k4VzMi/IxNdnVmXtc9OpUMgm1V?=
 =?us-ascii?Q?gG8VfmtTPUhPjfsHUb//Qahk7mgBSYvRQ9hM4iP6DGOrLJWCrzAFZQrLDjwb?=
 =?us-ascii?Q?uV/vixs+H9WmDf6ddNb2Kg8jXvAEAO21+EyLLKXWukvDF//EoZJ5+pQ8nbgT?=
 =?us-ascii?Q?AgF4RqZRC3sNcBvpSDsESqQyHqfpKm7pq07JIldhBhMKgm7/EdkzIJJWmXQp?=
 =?us-ascii?Q?Na/Gzeb+7SCKI/KZVVM3keFZwdn9uGit0jeHzKbMe6aQqidgRuxEad1wkyw0?=
 =?us-ascii?Q?NdNjmBbNk1RkjmBVX4rwAKFHTn/olsMlvm4tOTj0cxJqDq2YYlasd9PKe7IM?=
 =?us-ascii?Q?ggzB3uoK1K+F/eE/HKlaE4fOt/o65qX+qlRFhmXh5fy3UxaJRCrO7aYY6vsB?=
 =?us-ascii?Q?tVqPu1yImEjNUPb+nR831lN6lxA+tc6wtuktQCSvmBrEItRI7nPl4LrgNaq5?=
 =?us-ascii?Q?8Yyl/cwtCqD7jIRnfQtPIqqitpAsg3Csd5YKGmzGnNN0+eV8JhY70Deal1LY?=
 =?us-ascii?Q?LV1cY06fQepqQfNmDg1z7YKMxpp7BsI26pKtWmKzxYPxfQ4CEV2pttnwzHRp?=
 =?us-ascii?Q?ik5s0YHFLTICqwlhY65c0V6Z0ygDAePh4AUj0+KNZg+lAgMfLHKLzKUtXMvB?=
 =?us-ascii?Q?A7LMUcR9Dik8VSTCc6O3Rn2vpkxjzV6OLzjOdGozhxiIhCKTvXWMg6wSyCa+?=
 =?us-ascii?Q?2Gm4ysCo5ILxexuVeDiDsFsbWflnq3e6RcP4b8ZofXohTmhBKj1Oi9Fpb88a?=
 =?us-ascii?Q?W6TAtA00ofKZ0KCp+uZlH7wUMdKp/9kdDZQb/50SOLQ4L90vwmSc9SEntxMP?=
 =?us-ascii?Q?jKOhZFNRcguuAkfa3/1LpcPKG4cIj7xf4xm/rnheV9Tdgtno60FQVsa1Qplh?=
 =?us-ascii?Q?iKu+CJTbcmwDMo7k0d70Wb0+rpEckqXgMQLyRFDRDlf7fwkwbBCWs5d/EbOE?=
 =?us-ascii?Q?ZcwQkhZ3Rpo6LTzwABVvkIcEs5rllLGzuVEog2fNcvWMGF9iCSrvEsHlB36I?=
 =?us-ascii?Q?RlF79zs8jF+rkYQffNBn0XCPbV4tNRO3zsg4U9xzJrwmY5NGsO1rzC7U80fJ?=
 =?us-ascii?Q?cW7JiGp8B7Rzmw2qtPKAW229dTzCAK97fEwByT8EXp4qjfSBi3/+Tx7UJ3AO?=
 =?us-ascii?Q?0xpLxTRnQF5VA6ObfbezlAtlH/cKv5E1Qw5clEr05A18UHEtjOdNMgn6Jn2b?=
 =?us-ascii?Q?jor84O5rvjgTCcxkuIMebKaCyyyTNj9U7Lklw9YO3DLwbRzkkpXIZb2qy8EK?=
 =?us-ascii?Q?pjSGj7KntYRKBLV5O14M+Gd/ATjUIAhnNRL4NC4YtgYMj+FGTsnUFFCdSyv1?=
 =?us-ascii?Q?EQlV7dkb91VrlpfeW8419OEt9vvhPzANoYfBvlDKBdC0aAVmLlzg4Lwkk6hP?=
 =?us-ascii?Q?HEsJ5uogKW9xaD5aqSAXqbzxuys+FadkcK3J1vl2SAd5voNOHbsLOyG7zzHF?=
 =?us-ascii?Q?LfePnJYeUwGZMf6xX6Wbv2mHTsdnO6KopZgO+ESdOL/QjRzwMiknoPkJLkG0?=
 =?us-ascii?Q?+ai0gfLQzqO3XAoSqKLpWvUuLUSRNvfnHIldy2xyFlmzYeqjQfYxcvw/SZ4W?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?IE3dMiul3olWhPOzbHRuJ4lYPcFYJJpZlfl2nyietcBRWEIOqhqv+D93T7No?=
 =?us-ascii?Q?CDCLfLqENc3jbRAvW+R8pFX1pI4NAX2Ncj34r6cwnDcor4ozDQSCaP51j2NR?=
 =?us-ascii?Q?ooqUtEDzHge8RbAcgAMTDPTpQGD0aAmsISW853qN+wXozDn4e2d0qZBDHzJq?=
 =?us-ascii?Q?gdlubC4nY2ogevEoig0sS3Nvgzo74p1HFEqk3JDRJP4KAyfvtWLrAoap+VSP?=
 =?us-ascii?Q?3mkYDxPZI7RHEbUpaRA0p01F/yI716hhYr1cHxauvv6G+o1L6ALOlswS7PgE?=
 =?us-ascii?Q?eYZtnF1qssvQgxZrqHKDCqzsBJZQq8aH6nDb0r0xFW+SG9humetKkf7l7BXz?=
 =?us-ascii?Q?N77T2MYTATQVB6+S1/DbglIoLji5EJyW/Hs3J/RHKc0iNmPXP/90G251XxyY?=
 =?us-ascii?Q?WKOoofRzwxuswXEPqSquKTD4jlbhwAkcBazCmaIyjMv2sNFrvh9XLiYGXh9o?=
 =?us-ascii?Q?vtwqP4E2ULYfiO0FLLOeI8JS86VWYxHKVWQvC0yAhAePL+GY/nsCneGlPJzs?=
 =?us-ascii?Q?TabCekNX9D5Id3zpm0j9Q54FtANEYG3kt2qoggpiVzwxZcS+bQquYc3Eg/xQ?=
 =?us-ascii?Q?AobSLr6h5viv3188CE6VKFQfPCnmNtJKcUJCw0QlcC8SFr1XYMkDZnixjIA6?=
 =?us-ascii?Q?9YfCPFwRwH9VkMBRsxGZdA5cQa95Vi691leUtyFAg6upzcFiag+oZeEWB/mQ?=
 =?us-ascii?Q?Tpi95xa2tnVM/x4e6FNO/C25BziWIYPkhkYv6cRDTFgArm6I2G43C/b+7KZa?=
 =?us-ascii?Q?sajcZQTXaAU7p+yMbBeExWc8z8RMgEe36HRs0+7Tm4SKt+PBBfqvEFhP1e/2?=
 =?us-ascii?Q?tcKD2eqs4XwkTRYtjd2ybilNRJDp1mhRAvSLuzK370HOOAKnqeLoWYVMlVOS?=
 =?us-ascii?Q?KLQjQuwV052Loggfi3wnPsmuWEzvTvatULFXgoU1tHZ8NtdLGjD3awRIfcvH?=
 =?us-ascii?Q?yGicC777mHGB2TIlru7rkaQeAzCEYtAad6/qS9AHQf3vJUwDM8fezakE/wFa?=
 =?us-ascii?Q?vmvyjms4sVQfA4WeZFdSwvODqOXfTxpZmTWKYrMrh+A0XIZUWpnFY/hkagAt?=
 =?us-ascii?Q?/EweGLwUocxsk4QTjENfUuENr5B68tSuprVuYTL5HHJmq2ZrKVCvlT9oyM7s?=
 =?us-ascii?Q?sJFRd2LuVQUs3mX+QXBsdJn7SLp1WOQf1vG20xBWUQVuK9YR/NoJb2+2bJ3q?=
 =?us-ascii?Q?czTB/THoLuFxQi4znG1Uh1Ax8UBuCCIc1mNwAQLPluokzgKuu8rvC29IYDkT?=
 =?us-ascii?Q?TLumFQkN/ISrqhtS2XiP0hJyn6DSxKIMxLfBZ85T0dNwD3yEx0OSF1psBkrC?=
 =?us-ascii?Q?hTvfHoPp2cTUrXhJtGcLJ3iaZJ3lldTM96sxq0QkqkEPZ8pIID0iZATy7NJ4?=
 =?us-ascii?Q?lZKMqpkx9ro6A/IkZLtwFf/mJxRqFj2+ZPuLuHUaPGhbWIK9rByBPmCUkDyN?=
 =?us-ascii?Q?FHIILuw3X8IxA+y9Ji8G9dyA9e9EUsQrRXWI3CdKKDrmJ3MTCFnT207v2wS+?=
 =?us-ascii?Q?cmSNe/8b1UjJsr3V0/GUv0EJKqjv1D+GUdgWnhECR3yfy71nwY4QHYI4OA?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d8a982-ac7f-4c8d-52e0-08db10f66121
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:50:58.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZBeBtlgbFcz59ZgCMuse2lZoMRm1u3rZtH4QVSumBpvaA84vHXISpEybBhHXJT3X6PIVMCetA+grIMGZb4ocQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=737 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170135
X-Proofpoint-GUID: RHBuj7a6gvuMBzv70eNE-aFY2GtCQy-y
X-Proofpoint-ORIG-GUID: RHBuj7a6gvuMBzv70eNE-aFY2GtCQy-y
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

* Suren Baghdasaryan <surenb@google.com> [230216 14:36]:
> On Thu, Feb 16, 2023 at 7:34 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >
> >
> > First, sorry I didn't see this before v3..
> 
> Feedback at any time is highly appreciated!
> 
> >
> > * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > > While unmapping VMAs, adjacent VMAs might be able to grow into the area
> > > being unmapped. In such cases write-lock adjacent VMAs to prevent this
> > > growth.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  mm/mmap.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 118b2246bba9..00f8c5798936 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >        * down_read(mmap_lock) and collide with the VMA we are about to unmap.
> > >        */
> > >       if (downgrade) {
> > > -             if (next && (next->vm_flags & VM_GROWSDOWN))
> > > +             if (next && (next->vm_flags & VM_GROWSDOWN)) {
> > > +                     vma_start_write(next);
> > >                       downgrade = false;
> >
> > If the mmap write lock is insufficient to protect us from next/prev
> > modifications then we need to move *most* of this block above the maple
> > tree write operation, otherwise we have a race here.  When I say most, I
> > mean everything besides the call to mmap_write_downgrade() needs to be
> > moved.
> 
> Which prior maple tree write operation are you referring to? I see
> __split_vma() and munmap_sidetree() which both already lock the VMAs
> they operate on, so page faults can't happen in those VMAs.

The write that removes the VMAs from the maple tree a few lines above..
/* Point of no return */

If the mmap lock is not sufficient, then we need to move the
vma_start_write() of prev/next to above the call to
vma_iter_clear_gfp() in do_vmi_align_munmap().

But I still think it IS enough.

> 
> >
> > If the mmap write lock is sufficient to protect us from next/prev
> > modifications then we don't need to write lock the vmas themselves.
> 
> mmap write lock is not sufficient because with per-VMA locks we do not
> take mmap lock at all.

Understood, but it also does not expand VMAs.

> 
> >
> > I believe this is for expand_stack() protection, so I believe it's okay
> > to not vma write lock these vmas.. I don't think there are other areas
> > where we can modify the vmas without holding the mmap lock, but others
> > on the CC list please chime in if I've forgotten something.
> >
> > So, if I am correct, then you shouldn't lock next/prev and allow the
> > vma locking fault method on these vmas.  This will work because
> > lock_vma_under_rcu() uses mas_walk() on the faulting address.  That is,
> > your lock_vma_under_rcu() will fail to find anything that needs to be
> > grown and go back to mmap lock protection.  As it is written today, the
> > vma locking fault handler will fail and we will wait for the mmap lock
> > to be released even when the vma isn't going to expand.
> 
> So, let's consider a case when the next VMA is not being removed (so
> it was neither removed nor locked by munmap_sidetree()) and it is
> found by lock_vma_under_rcu() in the page fault handling path.

By this point next VMA is either NULL or outside the munmap area, so
what you said here is always true.

>Page
> fault handler can now expand it and push into the area we are
> unmapping in unmap_region(). That is the race I'm trying to prevent
> here by locking the next/prev VMAs which can be expanded before
> unmap_region() unmaps them. Am I missing something?

Yes, I think the part you are missing (or I am missing..) is that
expand_stack() will never be called without the mmap lock.  We don't use
the vma locking to expand the stack.

...

