Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B196B6A1120
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:21:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN4Dy4KyQz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=A3FFwWbt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nCdKAcI5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=A3FFwWbt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nCdKAcI5;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN4Cy00RPz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:21:00 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NH01i8031518;
	Thu, 23 Feb 2023 20:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=sTtwtUOp0jQZ69cW4jMIpilie1/aeM6ghjzKfLQIcM0=;
 b=A3FFwWbtv1YEZqd+gABuaDWwLOZBUCmAvhDNLDAdV0q7LWog9Y7Sc4RIb6HEnakkyJK3
 xe+f9s8L9qIFvCM/akL4eTzzYCcEi2qNPhHD5GK58oNX4CFlRJhGE2G+SvGMZyrRUBGn
 xKIX2mqwI4HZ6ZZ5+eSjG/Z/+ecyrweMI9GsDSXOk/f4DG+JwdT+pOi2iExI5QqYL/4x
 egqlO8n7mezQQwvrHXYDE7PsX6IDHZm1Z3V4qGN6OEgGYqo60Bh5TxsJt6worc0YUUAV
 SKgEN+tqgJc0+p1/H+DjzM6ve7SVZenhysNzSE1XtqYorzxdZ3CrJwkrjVqYqS5kS6Cq eg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn90uk8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:20:21 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31NK0wS2017968;
	Thu, 23 Feb 2023 20:20:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn48tdf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsdUwPRUV24Sc4ZgXqGibMJDr6vI/gaEh7IP4/TgG5gWX/oIjarQIIDnRlarh1LCQV3uS328AI+JJRlkH9uY80BuYpK1iNStX+Yuv5pmrJuhFlJyuPsPIuFulPvPB5Z+2NWeTQnbeIr/wICYsBU2PAulFMtUlTPVSjXTVpkMLRHn/TETxsAhLLUBsigNmzrICct6SS5xJwqnec1riHlNyxknK5xdb17AobXvo3XAvYXzdBvA0Jz/5/LpE6+4TYlyl4zwT90BQB5mVk+wGgFGif0lMAWQocbUQvUpTYtBJ/BGTZX5+qVKLF7i60yYSSaLbJyc3bB4/SPqk+n2Lm5vJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTtwtUOp0jQZ69cW4jMIpilie1/aeM6ghjzKfLQIcM0=;
 b=PR1CDu11IO5igAG9exvrYaZXuIJKbkST7DJpVR+iFk9GY8ZN2MeW+ozqrmVLPNl+QZCN4mjlE5f6sAXBLKWwn+9VZIwy6J+HjP/rK0IhfeJdcHjtAx2xZoIFzf8RZyizTVU4Os+2pKPFWRY6bNUmKoIUKLJsaZjQOMsB3yiMLz9iziz9UtsEgoO6bBSpSYHTPkUZaVe6Eh6iJL5wVxmkqNmZi2LZQxENNORVg4KD8PpmxCxsGjY917goJ/NDdJHMJAnlEF1J0dcCrC9JL+8sdqdd7hG3nqugVtOS0d1B2A8TxGZFPKQR75iJLVBTvY+Dj/NdKp96gf0WQ2dumZLeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTtwtUOp0jQZ69cW4jMIpilie1/aeM6ghjzKfLQIcM0=;
 b=nCdKAcI5gAODGz30aTjcm4AdNzpKUXbzM6WFY2jSReSd30HYF26IQiNjdIBL05A0cyjW497DAxnerhcdPqvZ2+2UrAOHQuuVlmpRMP8vzWY0ByCRs/la3HMT7sHzDPa498pYTUt66q7fwJvxUDo+Q5y0Lj4HCX4HzDOXz+ut/oM=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN0PR10MB5111.namprd10.prod.outlook.com (2603:10b6:408:123::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 20:20:17 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 20:20:16 +0000
Date: Thu, 23 Feb 2023 15:20:11 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
Message-ID: <20230223202011.dahh6cidqxhzoxne@revolver>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216051750.3125598-18-surenb@google.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT3PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::20) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BN0PR10MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b074a1-e0ea-4e14-4b37-08db15db6092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pJUp82q1b9DAlJNDWpXe2OVlLTi1PyjFlUYyKqS5aIegNceCX6wPhwRQs9d/g6sNMr+6JZq5oseHArqdeacoZuIFAAiiGeKr4XJ4i3p07dYKziGVG8Wo6v9ccBtmUcK/KWmhTQ+sSOjXcKNA/G54BHtsE0w3Wse3S4ifC6kTCUyHmdhNyy7Y6f+gNGPa+jfIHvLJBY356HhSmGfWQBQAKCyoUuZRkirpI8j7I/vYUTyWYV6h6OkoIaJ/xKtwUwV/WLCmDyEch+7WJSeYLmj1rhONPV7a/yPlH9UhGa1euEw2xQuu0cKQGkDN88ZczSyO87Etgmg/ADTDPtEvZGRzWrHG6J1FA8Fbt3P1CgiJm6FD9TgYaOCcS/IkOR+ObfZRx7dzYCOIXO9uXAGAZhShZucl/JSPiXO3+r5uIFv1Plz93IsV3jTZOq5mQcajbFvSyWHnSypLqlm5GN078DYiTg4eoa2jt2jGL2dd1KU2y7PL1NviJvKJQMc1gouVICVMDbt1m/0NXY1C23IpZaPdsGhVoxH9Jeow0zDl5dyVfJGzePvjWJnlAuO2iCEfH/qq4rEiUUJv6gLWHe5TPtG2x8g5oSmxViZRMKHJrBCYT1o4MYSlpZn4qbfaTjaaFAYE/GF5QnNOUTz0pQIR9VhxVA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199018)(6486002)(6666004)(9686003)(186003)(5660300002)(26005)(4326008)(6916009)(7416002)(66556008)(8676002)(66476007)(66946007)(8936002)(83380400001)(6506007)(6512007)(1076003)(7406005)(316002)(478600001)(41300700001)(38100700002)(33716001)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?z+tAcGVu+RyhQgQtjWNxtPayN4+fVUEUZbMaQFxuBaf3SlBwhcesjueTTWsI?=
 =?us-ascii?Q?HXvXYyrXBXX65Sual9iMGE5CEWcIJODpYqK42AUGPL8gWzm4AV9rVEx3zvGu?=
 =?us-ascii?Q?16jF+CslDENdpdNd6DHhQ0c38SrmYZ47+9+DCdfDJdY6KVVpnN773s9bL6/S?=
 =?us-ascii?Q?xrFAQ7wrdY+RHJc/94fMNe+nX3QpcEmJlJOa303Kt+S+R6Rn1VeG0/Z4UoK5?=
 =?us-ascii?Q?qaMEpCOuAx4AZkpIrtUna16UWbGnOvz9Z4KSd36AAYgHNDevuab0ZQTZnO7E?=
 =?us-ascii?Q?d3tFOZJqFjKiDEMe3M6fegrmQTYyzu8uaBWtpWJNsFNrcIIWNlsEVRmb6EkD?=
 =?us-ascii?Q?L/IG7LI7GPRkMcYrqmc7t7ULVXTPfeono3lMQPjYJXmStxTxC5J8iN+PMpD2?=
 =?us-ascii?Q?BhEB0M48Z4oEYQgDU35KAKyb9rkPXZJJLsa9eIYP8OzaH7mTANM+L3WnOur5?=
 =?us-ascii?Q?ujleKyrtjO/ea0PD0ewULgP3Irb4lL4xLxwirlKxoEQTJVsYvj3L0GY6IJ8h?=
 =?us-ascii?Q?7csR96m/ejs34S8iuZoD7G24lG0i7yPV+M6rl7UlLTwDCh0/rmia/K70NI/Y?=
 =?us-ascii?Q?mJXbyTpGqQ3hR8ieyUsB9Foywn8Q+gwCrhdic9IsQDpEKmpYKo42ZxwAQqUW?=
 =?us-ascii?Q?v3vByrfrb6gnkjEo4GhKLG/VJzP9aoUQe0RlGjSoFdBv/wlKsFEoKhDBu8AK?=
 =?us-ascii?Q?eu2qCMDwsBfhH02t9rRn2YG2U70Zok+TUPtUsp6q17tm8cGitUJnWxHL2P4S?=
 =?us-ascii?Q?H32VNqA6LRqw5LYvrnXR12N3o1/BAkaCOwaYkJz9wEgFWFX/1iXK5mYt+O9q?=
 =?us-ascii?Q?4TUlfzsXQk6xvp7TAu6JPXYZDP213CtYfoyfyefw2e4zKaWx0vW2VfqMOGKb?=
 =?us-ascii?Q?3k3Z5vf398hDj3aGuGeOMBAX9Fv9t4tcyyPh3iPDdxbJgB4qoVrIUlbLC+Up?=
 =?us-ascii?Q?G+5qE0qStK/k7cGVFhpceaCfEMSGTUIYJuQvBXKmiXB074MnU3oOc4yIkfmc?=
 =?us-ascii?Q?mtC+jW/Jbtm3WlzCSfO8FzDrb/lzDSeH2VIVkWHdzyP0L12cRcYhXdTWwpVn?=
 =?us-ascii?Q?qDMQCRkwhyZHtcUTculPYd0kqz3QLMXquffq3sRxckWdj9CFZ/JLzWQIrLui?=
 =?us-ascii?Q?E33xOIzPNAKkmswda8XsMWtAkeBq/yd3XjxSFsM+S3r6e1ZfW2bLgNjq2xVM?=
 =?us-ascii?Q?CcwD8jqEXUvWNCuYCbTW1g74WKWgxH5VKfVGohLXqyCWeE8ui/ClmNfN3sgT?=
 =?us-ascii?Q?7buol8jTa8G5+/m37NZOBWvy2KhS3/ZKossDbaoZun/W91B9VSLRiLCf9keE?=
 =?us-ascii?Q?R7rOTtUZQjEpvB+VBYX1PA6WDrrJ8gt0Fdy3z2FqzQ74PDmnwbrxXEAOSlZ3?=
 =?us-ascii?Q?f43VCZcjM102qU9Dylo48SJlZfCNCcLODR1/7fuOwFGzZRxMFEHK7k4rkRmV?=
 =?us-ascii?Q?Jzfj3cUAi6now7KMxIhYb205Rq8LM0f2qlTo01XffyqKwBSzkbWmwLDUT2yY?=
 =?us-ascii?Q?jike8PHLsn7ZePBukF/wqYC82Y65siJRiqNpystjhxd2045CrvUXakTj1Zfn?=
 =?us-ascii?Q?rnVOslCBrHyJUBxszVOsSMso1bYVmlJYwiNDgpVX86vho4Jfq33VM8AF1xqi?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?W4tOD5PpfcDfZH7G7+4T65fb/x8LqOE0zjFdspOpu0eIizI2c2Oa6kfJqqc/?=
 =?us-ascii?Q?o+SzqBLlm+en1MJFh0hVRjhFx2bj/fRPhcH6WhfLSoStiXiCFscb0YxWJy3d?=
 =?us-ascii?Q?UsfqJIjT1QYULd3efKy2blMVj1B4QXL7fnGhsxq8/lX2EGpv3WlGDsLkgxol?=
 =?us-ascii?Q?TWquXOAJjAEM6D7pvaqEPswrQLZB/UBI7MZFnSUufgOjauVkJLb0LuFgmxQN?=
 =?us-ascii?Q?Pg0nNDjW2nms8hQkA00joPSXOe75BaKkSdTB3e3M5FukLgSIdWJ1dXXiKttv?=
 =?us-ascii?Q?B4szF5y7rEUvtFrVWDvnToI32PRZmmkCF/Vc1EcTPjIYhh8MPk+fyflgKwnq?=
 =?us-ascii?Q?AZI++Npw79sa1xqA351foVSNhOJKLq/tDGggOt4wk4sbJLtNmvaDfBUz1uVP?=
 =?us-ascii?Q?TsT50p9WYvwyBZwgUVbnjuWVX4mIhTG53WhiopkSaijCQLdLOBe7QN1XYAVR?=
 =?us-ascii?Q?AgLP/94VCCRxNMnEie3QxRhTDE+VkJaiqVXu4b4Iroc024/l7dsJ/JneZ++5?=
 =?us-ascii?Q?AspU0SftLrSIOmwFntqQ4aCOYrymHRuGs062NvdJArPR+BKGl5w0BQLd0FR8?=
 =?us-ascii?Q?SjLvS0TIaKQT1b50+EviBOm8VGgLEN+FTgW4tEX1VaJy/26az267Jb4DAVQP?=
 =?us-ascii?Q?dX1UQ/t/JxsH8KVEaOqpYtWrrnM2ToHU5p76m5LKqPYccgjfGKr9nIfFX1J7?=
 =?us-ascii?Q?2C8zQZxxHs3JUM/a9ro9LqKi721ll+g+uMktbZb+MD3poCqure/xAsejFMEz?=
 =?us-ascii?Q?ojm1g9f0E1IzWlVljrBzD/eEVeEp6oLBf9wxHZDxLjPEy1X6qz44LjVeAJ96?=
 =?us-ascii?Q?toC7LgQ/tYBmf7k8jqGLVgkNmfpOa54rwf1KBsYJbzSIORrhA6A9b3eOjJa7?=
 =?us-ascii?Q?0YHD+mhy48kHpXD1WAca+tJQ9BcrgQTY59xVTKn3UQ9NAhikN1/n+rQ7Xt/6?=
 =?us-ascii?Q?BzohE7T474dI+BtKVny1ZJq55vYdEDLVuKpSR/FSR9TYbE9tgALDfAXNZ5RE?=
 =?us-ascii?Q?DSMAFv8SMDT8hxyzdgEKlSL9FHHG9WPfJjQcpF5qxQBGXUwSKZN7F3jKYZ+h?=
 =?us-ascii?Q?WnfTZStqV6OLzIlpCbldGt0547hWXMPBU3EgqJ8KLIe9zl+zsjkWqYZQUvhD?=
 =?us-ascii?Q?s2HiarEr8pShav8I6i5kGZA7rhOdKYQn/nvgR7NBOBXippnplABUF07d5wLc?=
 =?us-ascii?Q?JzfwrMwsuZ8dGQJN3lBuOfGY+iK6EYejSsGRzJFWTBUIixXbemtHPhYRDquE?=
 =?us-ascii?Q?WYKjgT5M6g1JvWL/zRTKt2zsQ4fm2CIz8ysTnWBABbw3xN8upc9oMcs7BMrw?=
 =?us-ascii?Q?ph2krn/Sarh0OMUy65PjFGHLmogVcIe1BUO+ISxnL9vDitFNAFJL5lXOUP5j?=
 =?us-ascii?Q?t5nPyDKFDY/aPT2e9HTgzEvP0HBW3CcrEkES3VgI0CC/DgeoGiTlH0LGgN7b?=
 =?us-ascii?Q?V0oenhkPR7SlcIKtZM3tAdQtLuaMaQNWlVBePFYp9qR04krmOowePCZtFirK?=
 =?us-ascii?Q?t3TvtzLjP5LlVVSnmnWceIR90T/y1JG0UIDD7qnzWR9CGpaVsrOm8VO/QQ?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b074a1-e0ea-4e14-4b37-08db15db6092
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:20:16.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFwgZA9OzDtQQPvKlsu/P2kwOcx9+r5vVexcPz1WcGDUOCNqsp5CVhTT8+oar0jVerzQUfMDVwVK+it4jswCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=883 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230169
X-Proofpoint-ORIG-GUID: _gMGU6w__ZMOUcUwQzAmWZmNq0HJM7mt
X-Proofpoint-GUID: _gMGU6w__ZMOUcUwQzAmWZmNq0HJM7mt
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

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

* Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> vma_expand and vma_shrink change VMA boundaries. Expansion might also
> result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
> concurrent page faults.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index ec2f8d0af280..f079e5bbcd57 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  		ret = dup_anon_vma(vma, next);
>  		if (ret)
>  			return ret;
> +
> +		/* Lock the VMA  before removing it */
> +		vma_start_write(next);
>  	}
>  
>  	init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
> @@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (vma_iter_prealloc(vmi))
>  		goto nomem;
>  
> +	vma_start_write(vma);
>  	vma_adjust_trans_huge(vma, start, end, 0);
>  	/* VMA iterator points to previous, so set to start if necessary */
>  	if (vma_iter_addr(vmi) != start)
> @@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (vma_iter_prealloc(vmi))
>  		return -ENOMEM;
>  
> +	vma_start_write(vma);
>  	init_vma_prep(&vp, vma);
>  	vma_adjust_trans_huge(vma, start, end, 0);
>  	vma_prepare(&vp);
> -- 
> 2.39.1
> 
