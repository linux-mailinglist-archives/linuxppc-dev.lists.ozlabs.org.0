Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DDE6A1105
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN3yr6X2Dz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:09:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oorLOcrY;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CjVy2nb8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=oorLOcrY;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CjVy2nb8;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN3xq3HBqz3cd8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:08:46 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NGxexx030484;
	Thu, 23 Feb 2023 20:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=XOVVh7+uHikD/7VnssmT9ExJZUvsJy+ayk1ZEEX2nhY=;
 b=oorLOcrYHt7mlpcWb0mYD1Ai/yCXulCuD6q9e/WT8RljxdlCOEYGOR+Zj6RUlH1qkCIq
 D89fWVbWxwzpO9lMCbL+U5Fc0ChXzbhQvTqdiuqL7X/APOeqP3WmPThaTw9BSOpFDkKa
 RZT+mZUIfH8Ar0O6hPRJa9aPc5rT22lUcHvAnYkh7ZZ9P67utg7oWix2yL0avn682b6j
 BXcvVqPi/z/nzHY9bgb9B3TiOQMG3lh1Vq2W6uRFT4qBf6wzoJt2F7/TBR0RA5+9gKlG
 vg9jgb35H6W+243VEziEdkM+f0UZ8R3/WeXNtVyAXHvPn/2HByhca/JIj+vXb5SjDDTS VQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntq7ukdrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:08:11 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31NJpImf013420;
	Thu, 23 Feb 2023 20:08:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn4f4v27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:08:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCwGy8UMnSzanIlblPm5mOfH2YFQShHiGhLu0zfFGgTAQivj9SUmC5GZBVkw6mjoZnRmxS8vIjg0kg1HHhExeDJIHJrq4N4Zwx7ZtCclgH+wdjaFzftqdDQ+MlZEM+QDnDMLjEzWSpr4z1LkifdNkV82wzGMn8DgWB0GFXv2E8nq/Xr5E+U5ErLpo8iQCONynlEsGwRDifooy1mjkbXlsmWp1v4saIKww4pgco14tyJuGiYqjp8hJ2jphrR4TcMaprN1XNbIbxBtyY2PXyuMBD/RNL/SrDbFdlWdVYUwLICBi1qSjd89rd+t8v4NN30jvCGIyUUsmaU4Y4dnx+MZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOVVh7+uHikD/7VnssmT9ExJZUvsJy+ayk1ZEEX2nhY=;
 b=kZwwQ3SuuAh0YoeRQTsSWjXCfwOUl7DmDKncfU1OnVLSM5+KrmG+BfNRPkViEzi6ObboZjGJ3l6IVDWbVZV4Mmt8ibSpb+niJsa/MTmzT2JlELekfVdvq37lel0i4LLsTnIRjAXt74v90j87F035eMHUueIUgkP26BzY1gl7sXBdL51iwLIf7HRwgjvY4OmNLD8MMrq0EHzPCgpCqfzsHCyzEw/h7RtbKjW/sNl0mrqoYWB6mlMeQsGLYivh8kXOwsdNThtDR31/UxT+C5dYxBs7qyVileKrk/m0eppn5r6XbNETe7Np+t8EkXzt6sMTzQIb2rSGg47rysn9k5ocYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOVVh7+uHikD/7VnssmT9ExJZUvsJy+ayk1ZEEX2nhY=;
 b=CjVy2nb89NaJFVuNpbNIHosefnaS4XR5lpx+b5+PidnseMth6tJaij/epKjZCai5LoYte25uUuHWbTVfQPeJ7okO3Xw/D34gRbUVBSl6MUCmlzx12rjPL3wncZUXxDbMsBM8DS2vRPwPxyWTZt7585unNMkS/cm1heUAICSgSKA=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DM4PR10MB5944.namprd10.prod.outlook.com (2603:10b6:8:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 20:08:07 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 20:08:07 +0000
Date: Thu, 23 Feb 2023 15:08:00 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 24/35] mm: introduce vma detached flag
Message-ID: <20230223200800.5cydej7s2ybafuaf@revolver>
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
 <20230216051750.3125598-25-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216051750.3125598-25-surenb@google.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::21) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DM4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 97de06f8-993d-4287-2eae-08db15d9ad86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	574sIRg1d15xtUG5ybRy+f9yxAciKFYpxXmeWp9uwTnIEKfa//aqZURdrYa6OTdkQBdGItuF05E3DY7r15vaWy0NeLJgLEAVUe5YDLEdo2mRg79qvVr4oON6HyN42DNopZZVmTKmbdx1QkG84ahNeNFyHYuPFNlmm4wHkpC7GFNQdf2VmQ0WX8VriYeyR/qIvhhykidy7S1DLYfXyC0v8HeYKpKr/R8uAVVJSbBbtk91ElP91J+PY3f72lhlXoG7tixR1P1oL/2+0N/ZImM8QqZxsshf5hS0GxmVygHfvau/fDJCHy8NriloLfb+hO12l9yNWJ07muxvhV1HdZ7k1ZQUHun+JyvPH4BVkBCJNa/waZT7yHVRs6wXmMXgvMTFpAiuvYeDlSEU1EdkMNCIyF+t1Ko9d37i6BJZnN3ELBrXJTvMEamSB/ZoiJ7Pt7wWqG8Nn2dR+ytFRa1uQxJe8k5cNiCzIgBzeLEXIO/LB0BtNQ8ucu3wPdKzoRo+wSQpsq9sPvCexJoDBZUknpxNpDfyEHoZHeqbVioKfbAczuPmQMV1aXIIvDexh9zkCjgZQA8WfJCX9qoev/yiPb+n7FoHz0e6yQYQUL3NYHi1OmBxUnovSGbrIVGPQSfC/RFsnBOYLBgVAE5S2EKJLGt4Aw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199018)(6486002)(83380400001)(478600001)(2906002)(9686003)(7416002)(5660300002)(7406005)(86362001)(6512007)(6666004)(41300700001)(1076003)(38100700002)(26005)(186003)(6506007)(316002)(8676002)(66476007)(6916009)(66556008)(8936002)(4326008)(66946007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rdQJ4O5mHYULX5GUn9B/Yd8Ew6T+ldsvdvLo9f7Vu4RHO0pqZh7Xagt/oyQ/?=
 =?us-ascii?Q?JW6n3Bz9A9y5kVG2dmWaWMUqN/nk2i4BkOH5FsObNt1Pr7/c5CoaLleRIxPK?=
 =?us-ascii?Q?KTPouczOF/Ap3fLtyeRecj8waO2+KJrQ5rbR/kJt06kAegR02yv7UUES3DHU?=
 =?us-ascii?Q?b9Y/i1ioexIrrHOOrxoef3UWeAWF1qkZHZ6tp5485yG5OTQBhb8CvdOvgjUV?=
 =?us-ascii?Q?lVSqDgF5EM5/rS6zTxb/jjyb7ZH/a9eI1Dn2swx29zvEoYvzUuXe0lOkZ8xk?=
 =?us-ascii?Q?KAAsJ3009aQ9bF7k773+YGnWqizln3nIY+o0d5q+inrtPVCR60Sb5HI7Ri0A?=
 =?us-ascii?Q?OVs2XbIdbOVSg15KnVIqynlyNauE88ahjiAHFprTdwoajKfNyfYnLRafv1OI?=
 =?us-ascii?Q?KxW4eyxAiEfE4HRXQ527okmtpmWq5qdSwMIAs30ph1wyKEP4+CGFKd/tcOow?=
 =?us-ascii?Q?GZ7JFNbkbkvOafATtn8s2FoiCKYJ6U9RpxRxlnx0ErE4eVVPuwIgWJsGnrf6?=
 =?us-ascii?Q?DaQN8s6nMrU7JG2dBaosbpR3kgRyLA8G3TCH5D2zfN45fYcNwySMDVjKZkyo?=
 =?us-ascii?Q?F6ivzxGRaYYFQFTK11ntUVDEod4SBD05nLx297EN/YYPXAS6dL1z8BGVzMHs?=
 =?us-ascii?Q?4zKL2L+lWKkQoVyVZex9cyjBBu3qAit0EzYk9PKrYy58XOz27K/4vABsouZ+?=
 =?us-ascii?Q?3EVj8eg8sp1oxQz18Ms9bRrxAgebph0KIJesV38zpukW1PLnSwvLLlKy1OLv?=
 =?us-ascii?Q?vaMpXpbcmW3LJnK5+nO5O83QI6oNdPWq/HFj4SKWabga5R/zjouDECb+XVTF?=
 =?us-ascii?Q?A0W+RMQbYj8WMk4pbmtSTNxvbLynv4tq5TeOWsxBssAkC+mkusECqUO/vFNv?=
 =?us-ascii?Q?Qsz2I2sBMyDeO6XjlS4mNbZefqsOO/nX9iayt3C/NtZezwoPNvy03dHZVqN8?=
 =?us-ascii?Q?KA5r/IO1L3pasvFZrdyzmRBwwghxoKiHZAbG6qPdSrmxcUkb43nh18L3xqEG?=
 =?us-ascii?Q?7OxgSvkgPAwVK3UWmRQ/VnKf7lQSYMUOj0Xqt6ug8SsWtueazkszO2G2N73H?=
 =?us-ascii?Q?oQ/UBtNp3owbZcf0GUdk9tZpSMVY7JuqxpslfJBxlWhpP90zfpGmDP/9Npbm?=
 =?us-ascii?Q?zMgTMYGuL1cGSHAZzgQ6fSRwq7p3KiFnqzJrIXSJQ1EBr+jhOyVjbtEUIn+S?=
 =?us-ascii?Q?OtqDncO7heUPKUZ3NOyQKX/160dMaCPTeWt43F30jdSfL8jV/MSGOrow8lxm?=
 =?us-ascii?Q?OwMehDA3mBdXww6lYUTUq5pMo1tuoAioihWsw1Jt9wqwS5gj35Z29qDPmEjW?=
 =?us-ascii?Q?VWouUkVi/UEEnAwamQQf3nFdIhDISe0VGBFj1S8EgxxNZmeOL3cCXmP0rymf?=
 =?us-ascii?Q?gdsEVj0ElWuE5Wu5Kz+2ctyp2SXNB1RhB6fw1HwfFBriVjUWl3FhdFIu00Xp?=
 =?us-ascii?Q?Y7VODe4cxMQ6o+8iTt8dzYRmuKnLOdYm523R5+bfQVQGfoqM/qDJgumU942H?=
 =?us-ascii?Q?io7Mbj1WpIUHn4JhC4egjYize4xCADuElukXHO911Iia6pb+MSHZmrnIeKKp?=
 =?us-ascii?Q?yTSOmRjpHd2HddkRm98SZpoBtX8ZyHxhEUCGevwp/ZRYq4mO9xygp8qKWfv9?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?l5Tjbu9WrVTTtiaIC2f754xEW2pRqhmtiZv9OLNS7dlXvTe+So8NyhFPDrLK?=
 =?us-ascii?Q?kEu5t082wJZDJ4wD2mH2WqBmUz9WtVG6uDxajOkfbD3iN70lpJrZikl7tvcy?=
 =?us-ascii?Q?yWXcah38J5mh0CWlnQJaieee95tM9VB3jMFwWPU5oZOvNiL61nfaY37ZuG2c?=
 =?us-ascii?Q?JCDCFS4H1QAQXJDjRNlpJCfc6JDeAtcZ0GkyiUjgolKMNutQe+w36Aq8dH/i?=
 =?us-ascii?Q?qgEoBw8+OkM1j9a+08Phn5B3ChVfzF+Gyvhc4ybiF93DEOIXT1a36lUUzASf?=
 =?us-ascii?Q?QyxuBcjLw5OsYWbX8G5bg31ucWI19dqBwkHjF+WAaVBsCUeDXPQLyXOrCeHN?=
 =?us-ascii?Q?z9U+vc+gVA2pq/yOcERw62F6j0GjgNYZiGijtLEqsqOVP63jtcCH1HPplrpA?=
 =?us-ascii?Q?vyKO2ptaaspRzU2mkgjr4s9x8pfmAWxuqQX/g+8cOI/iQ8/P/Nly7manaTjz?=
 =?us-ascii?Q?J4R7Q0AAzc84lgplu/G804eHXfsBbrK4PywE4zYLRle9Aki/xIHYSk5isckq?=
 =?us-ascii?Q?x3QvbIy9q09EbZa5KU/V2Y2y5qyjbrouQPu5yqGCcHZZ+iTLxc0B6pU2AgoG?=
 =?us-ascii?Q?BSc9nxffzjIe4H3PeSaC2kMZz3edbbLWxWTCOhqRLa0zxYh4d8nzerdSdoRv?=
 =?us-ascii?Q?kYIGMCIiVdZGEvEUhhj7hJjtKPgqSQkUe6RglxsbxslJE8ZVKuHIh5AKLCAd?=
 =?us-ascii?Q?os9xojjy82SdPcblDGNjuemETOqpkC3ETx2YIkzdD73+TaeZR3K4+YcAJlrK?=
 =?us-ascii?Q?Pphkhg2fwkFnlzcra2GK98lO5UzLHStCrHnBwp0RikKRjfC1vJHAi1L7yusb?=
 =?us-ascii?Q?ATN3CKnT14Q/52iDKQ8jSFM/XB/zLTfrdPl6fJ5SY6KY5O+KagzZaCelZK74?=
 =?us-ascii?Q?MMrP0iyzW1sulY+cZ7PxflZFMNmR8cNVY+VtJTPzbKAXR3dNSNxe1yWs+N5X?=
 =?us-ascii?Q?Us3A1buBjMc0kwg+TlMZaUXuMTbUTNqnfW2gAX91bsg1bPlLYJA67W6L8fqt?=
 =?us-ascii?Q?ich/Vkiw9Ny6ggumDopaZuS8OFnQdDtStrHQHKrO9LZfXs2FbFR0XTpqexWZ?=
 =?us-ascii?Q?lb4haHwuZ1jpybQ2TFaak+KgYA9IumWYdvvwUFbnXV66UMzZbIcB61BNdr73?=
 =?us-ascii?Q?6/3gUIxbiYNFDC/ZWJ743hGJjmeYovPr4M3qYsqYR/ZZ1twC/AShTbggYNbi?=
 =?us-ascii?Q?hqAQLwM81mNOv+d2SHbnmg9gIweuoq4kgOZoIIY6uZXWtWPVZbfl490Ne+Pn?=
 =?us-ascii?Q?F5BKC3JEq9mmhwsc5EhTAyxsr5s5ugDaM7seiYAiTBG4MqlUpu9amcdUVuNk?=
 =?us-ascii?Q?tncj4E07TVumZZag0GA3fCLcQ3yO+R6h9sH9gERrDmJmbrblA5tYdYQjpHdt?=
 =?us-ascii?Q?Pz6gTFNlwFo9yndFAZwboHbEsqZl7n5gqT39L7Hy+xVvrsVZ9ViJTVZqOCV6?=
 =?us-ascii?Q?CplbRogyf4p5G+Isaqlx1dy2iETIGh4psxE5YgXftl+F93At0Ukb/NYEiVpP?=
 =?us-ascii?Q?D9FCQ3zU5ALiK6buQln+liWJCJ+DSiVA1R1P/n2/iW4UsdBa3HEbe17Iqw?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97de06f8-993d-4287-2eae-08db15d9ad86
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:08:06.9208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/yuFlvVPt378LYQwYLAdxb46taW+X5W8Kmc7HSJmauRBhQz4yYubFwtrUfh3pGXrYYF5qwtJ7zUHAAquQ6E8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5944
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=521 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230165
X-Proofpoint-GUID: tg39cyVitSV34GW8CEoczo0UurhKQWYX
X-Proofpoint-ORIG-GUID: tg39cyVitSV34GW8CEoczo0UurhKQWYX
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


Can we change this to active/inactive?  I think there is potential for
reusing this functionality to even larger degrees and that name would
fit better and would still make sense in this context.

ie: vma_mark_active() and vma_mark_inactive() ?

* Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> Per-vma locking mechanism will search for VMA under RCU protection and
> then after locking it, has to ensure it was not removed from the VMA
> tree after we found it. To make this check efficient, introduce a
> vma->detached flag to mark VMAs which were removed from the VMA tree.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h       | 11 +++++++++++
>  include/linux/mm_types.h |  3 +++
>  mm/mmap.c                |  2 ++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f4f702224ec5..3f98344f829c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -693,6 +693,14 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>  	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
>  }
>  
> +static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
> +{
> +	/* When detaching vma should be write-locked */
> +	if (detached)
> +		vma_assert_write_locked(vma);
> +	vma->detached = detached;
> +}
> +
>  #else /* CONFIG_PER_VMA_LOCK */
>  
>  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> @@ -701,6 +709,8 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>  static inline void vma_end_read(struct vm_area_struct *vma) {}
>  static inline void vma_start_write(struct vm_area_struct *vma) {}
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
> +static inline void vma_mark_detached(struct vm_area_struct *vma,
> +				     bool detached) {}
>  
>  #endif /* CONFIG_PER_VMA_LOCK */
>  
> @@ -712,6 +722,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma->vm_mm = mm;
>  	vma->vm_ops = &dummy_vm_ops;
>  	INIT_LIST_HEAD(&vma->anon_vma_chain);
> +	vma_mark_detached(vma, false);
>  	vma_init_lock(vma);
>  }
>  
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index e268723eaf44..939f4f5a1115 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -511,6 +511,9 @@ struct vm_area_struct {
>  #ifdef CONFIG_PER_VMA_LOCK
>  	int vm_lock_seq;
>  	struct rw_semaphore lock;
> +
> +	/* Flag to indicate areas detached from the mm->mm_mt tree */
> +	bool detached;
>  #endif
>  
>  	/*
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 801608726be8..adf40177e68f 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -593,6 +593,7 @@ static inline void vma_complete(struct vma_prepare *vp,
>  
>  	if (vp->remove) {
>  again:
> +		vma_mark_detached(vp->remove, true);
>  		if (vp->file) {
>  			uprobe_munmap(vp->remove, vp->remove->vm_start,
>  				      vp->remove->vm_end);
> @@ -2267,6 +2268,7 @@ static inline int munmap_sidetree(struct vm_area_struct *vma,
>  	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
>  		return -ENOMEM;
>  
> +	vma_mark_detached(vma, true);
>  	if (vma->vm_flags & VM_LOCKED)
>  		vma->vm_mm->locked_vm -= vma_pages(vma);
>  
> -- 
> 2.39.1
> 
