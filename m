Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0A506FA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 16:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjQW65lfHz3bdN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 00:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=KFJ5tTyN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.166.238;
 helo=mx0a-0064b401.pphosted.com;
 envelope-from=prvs=11081c7a60=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=KFJ5tTyN; 
 dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjQVJ53z4z2xnB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 00:02:25 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JDODrb032162;
 Tue, 19 Apr 2022 07:01:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jXCFpMh4Gh2YVe5PbI6dIurLDiZEXeJwE3HRp81A8QA=;
 b=KFJ5tTyNDMun33qlExgBxonV+Ds1jR8H/Hv8rHRPqSTvD1Ll2rCf/EwKVqIEhW3mEm9t
 RP7Lw+veXRwjIuQdWH+C0gWAJannXQi0kDcxeqdvuYnQOHzW6zFJ47PQ3kkKwR2/xk+D
 1dU5TPuuJFFkKqrvy+C+HwkSJaztwP9654loxdKTdJJMSa0aj+KNyicMNTfrwjUk6ivC
 NPirDrt/TiEnAAdubHfqoX8U8CSoEhFyqWeymEncxr7PWafTRwAYPc4trAeCDB+NyxAK
 pgbv3g4TtIY9Z5ecag/5Fq28otObiZCkKXCg5RqkES48K7XuvEQxw6I+QWp7RRDFQkbJ 3w== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3122w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 07:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW9lbKMcl+ew9NMrZlp/zytyB+fC3yZinAMkhcUB530DcDZKXbedSAbgR8jLBjrPwwyJyzDPqRvvrW8Eu7+0idwYvA256ShSxbkEqDHoneyuyDT3fkGx6UZJ22lsHbPwmtSM4i3nnqPDBJFnnZ1HOTJRY48FYlR6tlY19CMiRyVugDxC88D/eoZ2xA18A7kyibe1UNfY1NxYFWieKXKihwn4i4tHaugADq4h9USq5z7RuW9SKn9bQK6OItV+s6tlzUI56pmdGST6b1jmhR85yt900EHmI2cVzWxTmORM4Qg+AG+ZPWW6QD2RkCA0yLogzXGDb16eSTH7bH7E6/XB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXCFpMh4Gh2YVe5PbI6dIurLDiZEXeJwE3HRp81A8QA=;
 b=nuVa+0bA1Eg4I/e61Q78Pyj8zJfE50GzKlXjniMh7Ylm4rm8G8kDzCuQEnKhHdsW3iE8QJDTU9bvA0JkBR8BjivBmNwrtKZAL71Su0EvF+tOh0Z/DVU6uhGqIhIMkdf0sV094g2vamrvLyAfth/yf5d5MLn2OY7EnVz3dqYn6UsfpZTJcow8U0rQKuyJuwfS0uq5Bd6NOb7g82TR7yIZsjkeO+i7C19uEvwKRqerhz/tcAXyMRg+55zSWS7YROux+sC+u+ploqJPdq27sS/PsYJcYlst6ILoEXsgQ6xg9o1gh9oY/EWNApn91JhOzlT27tYklBc+hhKYeHMYXASdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by MWHPR11MB2032.namprd11.prod.outlook.com (2603:10b6:300:2b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:01:28 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 14:01:28 +0000
Message-ID: <b328bed3-ebb9-6fba-9585-79946262c40f@windriver.com>
Date: Tue, 19 Apr 2022 22:01:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
 <202204181457.9DE190CE@keescook>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <202204181457.9DE190CE@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0117.KORP216.PROD.OUTLOOK.COM (2603:1096:101::14)
 To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f729ecc-0a84-4960-fd7a-08da220d1956
X-MS-TrafficTypeDiagnostic: MWHPR11MB2032:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB20324F72622BFAF8FFBAA91C8FF29@MWHPR11MB2032.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkC/4I12arSLfooNxGGC600fzzrBRkKonAA3IUhPImD39Da+cWkOzqQ+WH6beSYAhktA8Q5CyMSVqPxvxIECEe0mqExzLdnqRxMssDWPdSy8FBMpi1oqEwPUFfWDeLYmpHIV9HQoX43pgq4iCbWBf3RQDji2/X16P8o1M28/K0gw8MkecA18f0R6sRcr/VKI5o3Pt9ZDBCnIptaYrno4mFkBIBJkwo2phqTGCiLbOvV1EaKwGhglDsv8Wu6xSFTj4MnfZnvqdhsyCD04YQG+GNN8I3NJ9lUVSJZgpDT26s9ufjWRK2ON6I9pZeB91epPkqVi33aSEl9DYg8UsoJUCtyu0VGsKmBpMbsgryPEfv+C/HJjY3guWINy9FfewcVEUNusCV7xK6ycaddohBV8hK3sfQj92/fzP6cvVi+00t42MCtL90GIsaiLKRJQQKo6Grzz/PEIyrbgKQqZu62vPfS4TDRJNEFT51yp9pMfUvCkL6Z0iBzeLGZCWOp0fRU86Su2gZQq9WudJzUO2qZtuXjkYRQ0hLugEeN5mO4V3dmbwjX7dlsjIUURkWll1iWaI/N8v6wOtzquaZ2c15RzoZsyXWsY2ZU6CilVkL8c+YxFSZw3W0UAoqnsQ+u+2o3TpdSW1DpVI7h/ponC6RXutKEQ2WIDIi6h1IC0TGxiqMML9OP9wZp/rtXYOsfmt+wS0wSSI4ExNKRvNg6041mstvm4ZeChV1hRDjxYXHCzKcot4nfRqYGI/OPBa48bT5Ej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2616005)(8676002)(186003)(38350700002)(4326008)(5660300002)(36756003)(31696002)(508600001)(6666004)(26005)(66946007)(66556008)(66476007)(2906002)(6506007)(6512007)(52116002)(53546011)(83380400001)(86362001)(31686004)(7416002)(8936002)(6916009)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFNDOWp4ekREQ2IyUytTQ25yUU1vaHRLNkxhaWpINjlLSnpBQ1lJNjJHdFBR?=
 =?utf-8?B?VlJZYTQ4SkUySDdLTWdFVGxRK0w5L1F0a0xsVEhWT0Q0RGVrYWdud3VxS04w?=
 =?utf-8?B?WFpSNmxhVkRrUndGb1lqREVBRDE4TEV6Z2VwOWhUZmdKYlJ1MjVuVkhGSjZ0?=
 =?utf-8?B?M1FDeGdMeStKMm5aaktGQTVHRmF2di9VcThyOVc5Y0EvSkdwMjA1ME4xOTJO?=
 =?utf-8?B?MXYvdWpRTkVhTjkydDE4c21rUEd4NFg3OXZwZG90eWxBRjhKL1IzTENmN2cy?=
 =?utf-8?B?K2cvZ3dzeTdsYkVZL01TS1BXcjFlUXRabkhOOVdDS0QxNTIydTZUeENzVmhK?=
 =?utf-8?B?ZmkvY1dBZ1NTUEMxZ1dPNW10bXhXSmxGTFJ4RnhzdkJhaWRsRWw0QWhiVWV4?=
 =?utf-8?B?dmZOV1FBbXVibW9WbFZBTzVhUGdlRlN4ODhVaVJJd1FEYlQwc1pyNEgrK21o?=
 =?utf-8?B?L2tJOGs3TlUyeGNubFBRK0xwN01ab1ExOEVWSVNudXdvMWtZNHpPRU9qa256?=
 =?utf-8?B?ZkcyZ09NNVVZVWx4cEp1ek5WcGo2RlozZHEyOWxOalhWVzBxL2tveUtZbHdP?=
 =?utf-8?B?ZEg4M242ZkIraWhoQWtFZkwzNDl1eE5kZHNqZWQ2NzFEYkRPRktvWW5QejQ0?=
 =?utf-8?B?TFA3d2s0NHFJQjJkU0QwYzgzSHRBMDN3eDJMZ3ROcDhncHJOcXdQOEhQYTJ0?=
 =?utf-8?B?d3ZHV3pMSENNZDJxWkdOcEhBZDdjQkozM0F1MXBPZjNUb0I3OEZDUVVjc0ww?=
 =?utf-8?B?eEgzMTVFT09vRnRhMFZqTGpiL3UzcEpqUzlKSGxXQThmczNReDdVUm03dmZ2?=
 =?utf-8?B?bzAvR2h4cHE3dW5uRnBMNjY2ZnRLZW12MFdXUHJSZjR4OGh0azF6M2dRMTVi?=
 =?utf-8?B?K2FkZEdSZjIxUW5QWDgvTW1KRVZ5c2NDemd0NHZVaTBRVDlHbE5LTHp6R3U2?=
 =?utf-8?B?UDJoaFpmMEJOb2h2M3MvK0V1d2VPaUIzYU0xNHQ1ck9mV1doTTZZVDRhYVhh?=
 =?utf-8?B?Z01ySWgrQUhMNVRZQUVhcUZ0ejdSYzZvNHFrbDJUcFVwa1dEZDl0b1lVdXZt?=
 =?utf-8?B?bnVyV1BVMlZwWWUxZEV5cCtBeURId2tMeTQrdkw3clF1NEVVbXVOQzE1aVkv?=
 =?utf-8?B?UTNRcnhPcVdMZHhkbkp4UVNFTUlMSHlwWEJ4QXBuNlIrbUVERTJHNDAzeHB3?=
 =?utf-8?B?dUxnelhHcCtsNzU2S1JGSktLSUQ4UVRRcFpiRnRNcTNKcnlOUVJkODA5YVNi?=
 =?utf-8?B?eDNtM2dFbXlHOWZkR3Z3VWhXTlFUQ3M0b3JUNVlsdjBOdXBseFZXbjc3cUw4?=
 =?utf-8?B?QUdzenV6bTlSVHdCRmxXSjdWZ29UK1VOb3pUYTJRcmRGWHc3Mk1EYjFCL3hH?=
 =?utf-8?B?bzBVbWZORWt4K0xSNlBSdkJFcnBsRjJ5K3BlcUV5WlBtUDdJMXVWSzYwaDYy?=
 =?utf-8?B?Q0dRVjh2NzdYZ1A1ZVpUVE1pek0zV3Bic1NEV244SHNIditBRE5BaFdxRVBv?=
 =?utf-8?B?Z0JSaDhORUJBN0NMSXRxMy8zQWZvQ1VLWVZja1QwaHJyZXdWYXdXdjJoZTBZ?=
 =?utf-8?B?KzVnOGZ1STJLQzRpRG5EMllqTDhUMmo2eVlPVDhwVnR6WExkKzJZR3d3L1VB?=
 =?utf-8?B?R0NWcHRHWDFKbUF3ZkRnU1J1MEgwL28wNEoyQ1FIcHBsd1NBdlA4LzEvVTdz?=
 =?utf-8?B?d3p6UFd6QThJcHl1SG9KejFVdWU0c0F5aENsV29XRkpzYm12NTI3MUdZbkRm?=
 =?utf-8?B?TCtEWmw5eW0xN2crYmFYUEYzRUt2dGk1UFh6U1M2bDY3UkhpQjRRSVEwU3hS?=
 =?utf-8?B?cEpZaDhNL1BKYjdtTFhRUWF4bnR5Q2dHODdxcXRVYnVYS2huUmhLYXZOREho?=
 =?utf-8?B?RmNlN2IrSHduc2NUcncyREpycTFHVXJiREJUL2tiNlRsaUVsSHJ4dGU5OC9K?=
 =?utf-8?B?RVVQYVR4LzRRMVNvcVExRVR2MEo5TzBXQXd5Tk5qeHNrY3BZR2FIZVhHQldq?=
 =?utf-8?B?ZWdZd0VBeHBoYXdWL0t4OTk5MGRMMXhFWmpVSUJJa1NKR2xFYS9xMGQ1RGx3?=
 =?utf-8?B?SXg0KzlxSmlCYXVKMTNMSnJSRHdTL1RFRk9oeDhnK0dteU9sdUFFZjh3RFA3?=
 =?utf-8?B?d0xzM3FPdE42TGJua2taTml2VCtTNElRUlgwa3B0UXVlNnVNTWV6RGpYMFVo?=
 =?utf-8?B?R2ZwZStXS2YyOXhYQXBFbEJkZEV5aTYyUlFzT2dFeklkTEpBMVZrbTBzemZ6?=
 =?utf-8?B?Nk42WFN4aTZnbW92S3dyOFVUMHFocUc3Wjg3NmQ5OTd6eEJBdjJQQ24zVjBl?=
 =?utf-8?B?VXl3aDhaRUJZbEx6eUorSmYrQ0VvOGMrbWdEeUc4clN3dm1wa1NpQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f729ecc-0a84-4960-fd7a-08da220d1956
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:01:28.4053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ofdz986LEKxDB5WOOyhz1lzVQF6NK644vtKn+kHO+oVJz1O+tbou2+FlkgtBVKWPdqIeDPkFzHzuyoUZdFUyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2032
X-Proofpoint-ORIG-GUID: XL_uwb1FUFV8AwVJ4nD0WxJv-_Y2mNvz
X-Proofpoint-GUID: XL_uwb1FUFV8AwVJ4nD0WxJv-_Y2mNvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204190080
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
Cc: mark.rutland@arm.com, linux-s390@vger.kernel.org, x86@kernel.org,
 hpa@zytor.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/19/22 05:59, Kees Cook wrote:
> On Mon, Apr 18, 2022 at 09:22:11PM +0800, He Zhe wrote:
>> This function checks if the given address range crosses frame boundary.
>> It is based on the existing x86 algorithm, but implemented via stacktrace.
>> This can be tested by USERCOPY_STACK_FRAME_FROM and
>> USERCOPY_STACK_FRAME_TO in lkdtm.
> Hi,
>
> Thanks for doing this implementation! One reason usercopy hardening
> didn't persue doing a "full" stacktrace was because it seemed relatively
> expensive. Did you do any usercopy-heavily workload testing to see if
> there was a noticeable performance impact?
>
> It would be nice to block the exposure of canaries and PAC bits, though,
> so I'm not opposed, but I'd like to get a better sense of how "heavy"
> this might be.

I just did some rough tests:
hackbench -s 512 -l 200 -g 15 -f 25 -P
Such line would hit arch_within_stack_frames at least 5000 times in my environment.
With hardened_usercopy=on, the execution time would be around 2.121 seconds(average for 30 times)
With hardened_usercopy=off, the execution time would be around 2.011 seconds(average for 30 times)

I'll test the original x86 way for arm64 tomorrow.

Any other workload needed to be run?

Thanks,
Zhe


>
> Thanks!
>
> -Kees
>

