Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46D509C31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 11:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkXBn0Py1z3bb0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 19:22:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=XeM3q16L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=1110f56b4b=zhe.he@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=XeM3q16L; 
 dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkX9v2vp1z2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 19:22:07 +1000 (AEST)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23L9AvK1026892;
 Thu, 21 Apr 2022 09:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+I/hKBmFfrLjDXuANwOpiS4CkWcsG3eDjGQfRygSH9M=;
 b=XeM3q16L18aj5UTEcSHXtLfGCtcPX1UMyoFXE3PhELswGyMPPUeG0d1oEQqwhStUjQRV
 TAoPEM5mEMgZVp+T2xY8Xtz6sKxrHIKsi1nlyCyBDIyOO2ls0TxIDy2cylMVRhv7dCYt
 ox+VujbKP++HQHZz/BG29vM8i5H29/W9Jv7DtCxCOSA2ZjFlTjLPFoQaQbxB69awS+YE
 EY0UmXADi6UI281WaJ7DF/sg4Ck78SKiBosMe9UW2ibsLhFcY+au3mRUuTfsXEOajUBm
 zr8fO81ABQfRJnseI8V6VdyzzpM9w30Wa1StRw5ezqUBuCTRSa47+e3TVvZJWoAJN3Q1 pA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn3pn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 09:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA9Ufbz2Q7P/btY9P2h0kRDG2LVB8+2eDHCh/J715SRlOlU/mC0Qfxh4LWnYhYE3Mh1rQDoysBXf6/+9C5+sPbrZn6sVv7WKK/xbV/KHE4mANJggQ2zrOLqrQIwgyYKd1LLL6iHr7YmYxBTFHtj4Lqbku8IGBSqGkCm7cPuYGclvowEIO18qSLj772LpT2R69mwFFQ9/n63NOhTrM86hll2ihtccCKSiY370XoM+LErQipk1mfdEdb+1NdxQVMZnuKRDcPqGq22D0G05cyDABPVb0IJx77LTIc4eyZNrNG3m5U9G0P6sy0s2IEzbpep/79FttAE//h1yDdeWycipjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I/hKBmFfrLjDXuANwOpiS4CkWcsG3eDjGQfRygSH9M=;
 b=X/74RngEvpT9vXTXgVZDjfiDYKMV7V6oCF2Jm0zFM7LqovS06o8TAxZWtUUAyCtcAY9Ngi8bZZY1NZ/7iYmxjncAMPUpMk49QXFU/GwewzbsGdJPsEx6M7rgOYuSRrzGpbPj1XmU5qmoXeCWRKGkTb7r8uKuhd4sbWi1YWXbRzpO/yTIOpKuiakAj75OW2oWLQwf/Lo+TNV1akiO5aVRS3lyBa/CTK0L7KTplF/uKRSNsWGqiExV/CUyyVuqE3w8cYdi92J/R1rlBEoM32uAk74REMerN9qbf/koRF1TX/b/5xwFUVLtKULGJt/Tqo+kMfyXYF+5v3AuCsSBggwTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SN6PR11MB3438.namprd11.prod.outlook.com (2603:10b6:805:cf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 09:21:09 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.026; Thu, 21 Apr 2022
 09:21:08 +0000
Message-ID: <d57f477d-d976-69b5-5b8d-f111ac27bd5c@windriver.com>
Date: Thu, 21 Apr 2022 17:20:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
 <Yl7J7aVzKiWRtrGi@FVFF77S0Q05N>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <Yl7J7aVzKiWRtrGi@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f48a7c3f-0314-49e5-8b6d-08da237844d0
X-MS-TrafficTypeDiagnostic: SN6PR11MB3438:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB3438493E12A6FD820AFA371C8FF49@SN6PR11MB3438.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtmY9Mo0hQSkV8Lgb1tNfmeMD6kzkkcpF98s9pfqFFuz1esMjCJL74IcNEXN548OfwRsdse9t2twunhwupMLiATrVm2K9j9s+8UCljd7yjo+zGpYPVMiine5TSQzw4NClYzun2JGfqzu0CXSBRGABUuXbF69GNhJG8zu1/5LqRuXskmqWoWZPWDuMVJw8hP+CSSrvFfu3AMoFQgCyaSYWchy4PkDaJqEwkKHpcUIjktZX6WkzPyCXycV1doT6GTcdFWszBbTIbp6Xxaci3B3xzYgOwnS2f34xsWBqqr8YtApHfqp5lQuM+H4I3VMGOxJ/xby8eJpcUfI+GXVspg4YXj+jbsz6uM5vaSQ7vhv3c6u9UoTEE53Lqk12WgtyEIzY/Byqn7ZYRWBb5yTOM8oPoan+PlYBRK+O0E4vpTvGTPUM7ejiCo82Vcivax8IVDzo6ETHLhaGTYvwftZAGjlhT1Vlg+t9e2/YtTBpMjyIdXLVCqGqqrFyt93ptXK1CYM0NGbk3AqLGHeLUI/FRbnnFCOISTr0IAUtABMSQl7hOjRKzkg1wcG23osnED1RP3wkaXG/7zabuiTi1a6mKjVriEg5UvVKRfWQZw37rGqThMCxUlFaLORJ627eTCWgc0zQRqYLH/Jszc1wU2+E9SGnaMy5tO3GMhjuxUmfwjSMRzLzfkPKoklK9MybNBZM8xyoSpyU5ZE4TNIQCf41ZUvLExRcH8PN5VPVexBQVD3FM3T21zhFx1iOqXS1Twi+SpL+dXGJMRgJejPdfMfgA/GmhmTbQcMjEUdrg8NSGORE2ZVDCRSDqND879BF41rXBMEFvXdgKjvzj+mkjJfSnOh4RIRoXuoFsUP1tC2tYnRxnIIDIJaOWx2m+XsbDg4soLGDY4d2WDWYTjwwWSnctkqEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(38100700002)(6666004)(66946007)(86362001)(4326008)(26005)(83380400001)(66476007)(31686004)(53546011)(66556008)(6486002)(31696002)(52116002)(8676002)(2906002)(186003)(36756003)(6506007)(508600001)(966005)(8936002)(30864003)(6512007)(5660300002)(7416002)(2616005)(316002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L21NTU5KaTNYYzlxUE9WamE5dk9HZEJhQ1JlbllXQ2hlcThhcmZ4ZFZVMlN3?=
 =?utf-8?B?Nm5SZVFHZFluVkRvK29kL3RXUlVibW8weWk5b0ZjOHJMVTN6VU95YU12NDh6?=
 =?utf-8?B?eVo5N0NDMyt2bHU0SkltaUMzZXk5bG05YXFUUG1YcEpvamRMUiszUnNzUzhF?=
 =?utf-8?B?TEdxamQ4bm1SclByWUFuR0hiVEVNM2xnTkl2K0RzeGRJNUQ4NU5YMEttMVVK?=
 =?utf-8?B?Q2xmYVh3c2VsdExQcncycGVOa1hveXcxNlBhMThkVXYwcytUTjlldk9WclBV?=
 =?utf-8?B?YURMZXpWL2RzQTlYeUo3RXorL2hZRTU5bjZDOUo3T0xySkVXenFDR3F0R2ZU?=
 =?utf-8?B?cWRyWGJCZm5pZWMwWWFFOWczN0xETmI0elJ2SHZIMW1GOUJjazF4VlNCd1Br?=
 =?utf-8?B?Qms2WGg0dGRaRStGWENKK3JnelZtelRONVV1VWZhcVZxRmlUcS9rcW84Qk43?=
 =?utf-8?B?QmhFeVozbTE0dGlRY3dnMWFmRENBVkYvdFl1alJ2YVBFTUcwMFJ5K3pIL056?=
 =?utf-8?B?K0dZSnFlUVZYM3I1MTFuVjlZZ2h6Z2Y2Wk1QcGJFbEtST3dxNklvMllNSnVB?=
 =?utf-8?B?VTRIR2JpZHZRdHVUWmVTY0xSR1RjNWtjRlNDMzEzc05VMktkV3lrUk1Pcldk?=
 =?utf-8?B?SklWcjFjc2tsT09VSjdLUFB5WHVIZklOcUptaS9vR0dESSsyRStNMmxhRFNX?=
 =?utf-8?B?dEt4KzVlY2J2eHgvV0JoV1ZraFFva3hKS0V2RlRZL2txemhOWlpxUEc3WEVr?=
 =?utf-8?B?UFVVWGZRTFk0UHdwWmtRcVVTMi9NRnVxRy9SZjhvb1RJQS9Jb3luRUJPM1R6?=
 =?utf-8?B?K2RrMDhzOEM3dHl1d2R6TXp5SDRLa25SQmt2Nzl1RXhBdllTWXFxWXRlaGI1?=
 =?utf-8?B?MW1qa1pSRnNOSlVUV0drYVlEWnVHTFVsajBadUJxZENpUWExaGZKa2hsUlhZ?=
 =?utf-8?B?RGlXSG04WU9KdFpqZy9STS9JcnVpYTVBVFppQzc0d1Z0ZXBySExCZ1pHV3V1?=
 =?utf-8?B?S3czc3Bya1BUOWhRWXVZVk1sdEFRNzdNcElCU29lRkVPNTEwK3FWK1cyYnlM?=
 =?utf-8?B?VEl5YkRhMk4vRm1ldUVKeHBTU2VVUmZyVXdadWw1L3pBL0pub0ljV1ovTjg0?=
 =?utf-8?B?VEcvcUNadWVHU0JCVmI0dURLamhhU3FuSmNwTWFyNy9vSjdNNmF0L0Y5bTJK?=
 =?utf-8?B?WjZPNURydS91WGxDMk9yZCtJWDMvWlRVblpJQjNIUHFkRTQrTnY5QUlwYnY5?=
 =?utf-8?B?dWxPSGlCVElyVGorenlsVjE2bGdmeStuNUlBTWdNSjh2SkVMMHVaY2oxOXhV?=
 =?utf-8?B?emN0T1F4YzE2RlM4TDVwa1FxVUM2eFhEQTBTRFNsVWlPelJ2SE5SeHZlaXhQ?=
 =?utf-8?B?QXlJNHd4TEI5aEFMSlRES1VLakgxc3p0OGtobVhHN0hFVDkzbGFia1k0OFpJ?=
 =?utf-8?B?Y2dEa2Nwb292WjVFanB3NGlHR0haMG5QanRWb0EzZUxqOHhOVUs1MFJqcjNZ?=
 =?utf-8?B?TlVvODBJQWRhM3RMUFBYOGU3VGRsTitHVTFldmlDVml1QkM4eHFXbGcvYmU1?=
 =?utf-8?B?QnRkSjM2MVNLdlg4ZW1HWmF4NHhDRmlPZXVhb0xDK0ZTRW9aMXJsWjRLYzh5?=
 =?utf-8?B?Sk1wN0xYZ3dGZzlNNTJ3bHJLVXo3TTh2SHhSN1hXek5PSG0rUVkwQnhGZ0xZ?=
 =?utf-8?B?aVdJdXZxbldab3FSYnpHTm42TjZPZ1AvZG5wQ1h3VlljT0MreHBKQ3VCQk56?=
 =?utf-8?B?Tnhvb1ViS0JFNWhrYlVTN0hCT3dFeGM3TUVvd0RTSmE5T3N3QXhtejQwMVNk?=
 =?utf-8?B?QnpydndWWTdtQjNCZmhTWXNKbEdmU3RPVjZ3a2NJeFRxazd6Nk5SdmlHZDJY?=
 =?utf-8?B?WEhvWGg2WDNFRHRhWXRmNkdENjhPWUVlSTQyT0I3cWZVR0xmaXdSUVoxajdr?=
 =?utf-8?B?Yml5T3pzMXRMQlhxNlhTcVRsZDBhR3EzelByaGNpSHk1UExicFRVTFBkYytN?=
 =?utf-8?B?WnVxVzZrY1dackk3MlZpazRPdnMvNTdJbERIcVRYd2ZyNzkrRzRyNmRjbzVl?=
 =?utf-8?B?cTZlb2hWdS9IR1cwNmpiZzZDTWNBNmNYL0R6T0Z0ZlRxT2o2T0tyZXJ3VUgw?=
 =?utf-8?B?NjRRc1lzR0ZtM3htZW1naTNDMXd0WUdBUFAzaE8reHhqQ0RHN1d6MURmN3dH?=
 =?utf-8?B?ZC9oR3J1Y1krYUR3VnBDN0RKSmdTNG9WbElLMFRkS0Roelg1Q1J4elpSNmQw?=
 =?utf-8?B?dHNBQmdUTFo4d0xmTGoxbldDa1JQTVNjMnA2dFNmUkRBbVFXMjdLWmJHOEor?=
 =?utf-8?B?Z25QbXUySi91QWxaRUU0ZCtaT2RFaWdkQ0JCNW52N0ZHTGxmdUpwdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48a7c3f-0314-49e5-8b6d-08da237844d0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:21:08.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rTT8pxlKhd/72EMFwxs+jGS+ESG5I8fY4lKwlb2Vo2yYYW6L+dZqy2NK4wl9IGmmHWBieGKEa/PX9wRuQv3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3438
X-Proofpoint-GUID: Ycd9U5FO_xuAMobxvzLvIJBP9z9wd24m
X-Proofpoint-ORIG-GUID: Ycd9U5FO_xuAMobxvzLvIJBP9z9wd24m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_06,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210051
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 x86@kernel.org, hpa@zytor.com, keescook@chromium.org,
 alexander.shishkin@linux.intel.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, bp@alien8.de,
 svens@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
 borntraeger@linux.ibm.com, will@kernel.org, linux-riscv@lists.infradead.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/19/22 22:40, Mark Rutland wrote:
> Hi,
>
> On Mon, Apr 18, 2022 at 09:22:11PM +0800, He Zhe wrote:
>> This function checks if the given address range crosses frame boundary.
> I don't think that's quite true, becuase arm64's procedure call standard
> (AAPCS64) doesn't give us enough information to determine this without
> additional metadata from the compiler, which we simply don't have today.
>
> Since there's a lot of confusion in this area, I've made a bit of an info dump
> below, before review on the patch itself, but TBH I'm struggling to see that
> this is all that useful.

Thanks for the exhaustive explanation and info dump here. I've read through all
your comments, very helpful.

>
> On arm64, we use a calling convention called AAPCS64, (in full: "Procedure Call
> Standard for the Arm® 64-bit Architecture (AArch64)"). That's maintained at:
>
>   https://github.com/ARM-software/abi-aa
>
> ... with the latest release (as of today) at:
>
>   https://github.com/ARM-software/abi-aa/blob/60a8eb8c55e999d74dac5e368fc9d7e36e38dda4/aapcs64/aapcs64.rst
>   https://github.com/ARM-software/abi-aa/releases/download/2022Q1/aapcs64.pdf
>
> In AAPCS64, there are two related but distinct things to be aware of:
>
> * The "stack frame" of a function, which is the entire contiguous region of
>   stack memory used by a function.
>
> * The "frame record", which is the saved FP and LR placed *somewhere* within
>   the function's stack frame. The FP points at the most recent frame record on
>   the stack, and at function call boundaries points at the caller's frame
>   record.
>
> AAPCS64 doesn't say *where* a frame record is placed within a stack frame, and
> there are reasons for compilers to place above and below it. So in genral, a
> functionss stack frame looks like:
>       
>         +=========+
>         |  above  |
>         |---------|
>         | FP | LR |
>         |---------|
>         |  below  |
>         +=========+
>
> ... where the "above" or "below" portions might be any size (even 0 bytes).
>
> Typical code generation today means for most functions that the "below" portion
> is 0 bytes in size, but this is not guaranteed, and even today there are cases
> where this is not true.
>
> When one function calls another without a stack transition, that looks like:
>
>         +=========+ ___
>         |  above  |    \
>         |---------|    |
>      ,->| FP | LR |    +-- Caller's stack frame
>      |  |---------|    |
>      |  |  below  | ___/
>      |  +=========+ ___ 
>      |  |  above  |    \
>      |  |---------|    |
>      '--| FP | LR |    +-- Callee's stack frame
>         |---------|    |
>         |  below  | ___/
>         +=========+
>
> Where there's a stack transition, and the new stack is at a *lower* VA than the
> old stack, that looks like:
>
>         +=========+ ___
>         |  above  |    \
>         |---------|    |
>      ,->| FP | LR |    +-- Caller's stack frame
>      |  |---------|    |
>      |  |  below  | ___/
>      |  +=========+
>      | 
>      |  ~~~~~~~~~~~
>      |  Arbitrarily 
>      |  large gap,
>      |  potentially
>      |  including
>      |  other data
>      |  ~~~~~~~~~~~
>      |
>      |  +=========+ ___ 
>      |  |  above  |    \
>      |  |---------|    |
>      '--| FP | LR |    +-- Callee's stack frame
>         |---------|    |
>         |  below  | ___/
>         +=========+
>
> Where there's a stack transition, and the new stack is at a *higher* VA than
> the old stack, that looks like:
>
>         +=========+ ___ 
>         |  above  |    \
>         |---------|    |
>      ,--| FP | LR |    +-- Callee's stack frame
>      |  |---------|    |
>      |  |  below  | ___/
>      |  +=========+
>      |
>      |  ~~~~~~~~~~~
>      |  Arbitrarily 
>      |  large gap,
>      |  potentially
>      |  including
>      |  other data
>      |  ~~~~~~~~~~~
>      | 
>      |  +=========+ ___
>      |  |  above  |    \
>      |  |---------|    |
>      '->| FP | LR |    +-- Caller's stack frame
>         |---------|    |
>         |  below  | ___/
>         +=========+
>  
> In all of these cases, we *cannot* identify the boundary between the two stack
> frames, we can *only* identify where something overlaps a frame record. That
> might itself be a good thing, but it's not the same thing as what you describe
> in the commit message.
>
>> It is based on the existing x86 algorithm, but implemented via stacktrace.
>> This can be tested by USERCOPY_STACK_FRAME_FROM and
>> USERCOPY_STACK_FRAME_TO in lkdtm.
> Can you please explain *why* we'd want this?

We are trying to use the hardened usercopy feature on arm64 hardware and found
that the lkdtm can help validate the feature. But USERCOPY_STACK_FRAME_FROM/TO
checks, which were originally added for x86, are not supported for arm64. I
thought it would be good if we can enhance such hardening for arm64 and tried to
add the basic frame check like on x86 in this series. And yes, with all the arm64 details
provided above, this surely needs to be reconsidered.

>
> Who do we expect to use this?
>
> What's the overhead in practice?
>
> Has this passed a more realistic stress test (e.g. running some userspace
> applications which make intensive use of copies to/from the kernel)?

Just did some very rough performance impact test as in the other reply, But not
sure what needs to be done further.

Thanks,
Zhe

>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  arch/arm64/Kconfig                   |  1 +
>>  arch/arm64/include/asm/thread_info.h | 12 +++++
>>  arch/arm64/kernel/stacktrace.c       | 76 ++++++++++++++++++++++++++--
>>  3 files changed, 85 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 57c4c995965f..0f52a83d7771 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -165,6 +165,7 @@ config ARM64
>>  	select HAVE_ARCH_TRACEHOOK
>>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  	select HAVE_ARCH_VMAP_STACK
>> +	select HAVE_ARCH_WITHIN_STACK_FRAMES
>>  	select HAVE_ARM_SMCCC
>>  	select HAVE_ASM_MODVERSIONS
>>  	select HAVE_EBPF_JIT
>> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
>> index e1317b7c4525..b839ad9f2248 100644
>> --- a/arch/arm64/include/asm/thread_info.h
>> +++ b/arch/arm64/include/asm/thread_info.h
>> @@ -58,6 +58,18 @@ void arch_setup_new_exec(void);
>>  void arch_release_task_struct(struct task_struct *tsk);
>>  int arch_dup_task_struct(struct task_struct *dst,
>>  				struct task_struct *src);
>> +/*
>> + * Walks up the stack frames to make sure that the specified object is
>> + * entirely contained by a single stack frame.
>> + *
>> + * Returns:
>> + *	GOOD_FRAME	if within a frame
> As above, we cannot identify this reliably.
>
>> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
>> + *	NOT_STACK	unable to determine (no frame pointers, etc)
> On arm64 we always have frame pointers enabled, so this is a confusing comment.
> Is this a copy-paste from x86?
>
>> + */
>> +int arch_within_stack_frames(const void * const stack,
>> +		const void * const stackend,
>> +		const void *obj, unsigned long len);
>>  
>>  #endif
>>  
>> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
>> index e4103e085681..219b90c1de12 100644
>> --- a/arch/arm64/kernel/stacktrace.c
>> +++ b/arch/arm64/kernel/stacktrace.c
>> @@ -145,12 +145,17 @@ NOKPROBE_SYMBOL(unwind_frame);
>>  
>>  static void notrace walk_stackframe(struct task_struct *tsk,
>>  				    struct stackframe *frame,
>> -				    bool (*fn)(void *, unsigned long), void *data)
>> +				    stack_trace_consume_fn fn, void *data)
>>  {
>> +	struct frame_info fi;
>> +
>>  	while (1) {
>>  		int ret;
>>  
>> -		if (!fn(data, frame->pc))
>> +		fi.pc = frame->pc;
>> +		fi.fp = frame->fp;
>> +		fi.prev_fp = frame->prev_fp;
>> +		if (!fn(data, &fi))
>>  			break;
>>  		ret = unwind_frame(tsk, frame);
>>  		if (ret < 0)
> As on my prior comment, I don't think we want to alter our generic stack walker
> in this way. If we need more info, I'd prefer to expose this in layers, keeping
> arch_stack_walk unchanged, but having an arm64_stack_walk that can pass some
> arm64-specific data.
>
>> @@ -159,10 +164,10 @@ static void notrace walk_stackframe(struct task_struct
>> *tsk,
>>  }
>>  NOKPROBE_SYMBOL(walk_stackframe);
>>  
>> -static bool dump_backtrace_entry(void *arg, unsigned long where)
>> +static bool dump_backtrace_entry(void *arg, struct frame_info *fi)
>>  {
>>  	char *loglvl = arg;
>> -	printk("%s %pSb\n", loglvl, (void *)where);
>> +	printk("%s %pSb\n", loglvl, (void *)fi->pc);
>>  	return true;
>>  }
>>  
>> @@ -210,3 +215,66 @@ noinline notrace void arch_stack_walk(stack_trace_consume_fn consume_entry,
>>  
>>  	walk_stackframe(task, &frame, consume_entry, cookie);
>>  }
>> +
>> +struct arch_stack_object {
>> +	unsigned long start;
>> +	unsigned long len;
>> +	int flag;
> What is "flag" ?
>
>> +};
>> +
>> +static bool arch_stack_object_check(void *data, struct frame_info *fi)
>> +{
>> +	struct arch_stack_object *obj = (struct arch_stack_object *)data;
>> +
>> +	/* Skip the frame of arch_within_stack_frames itself */
>> +	if (fi->prev_fp == 0)
>> +		return true;
> That's not what this is skipping. The first time arch_stack_walk() is called,
> it gives the PC of its caller (i.e. arch_within_stack_frames), and it's own
> synthetic FP. The next time around it gives the FP of it's caller.
>
>> +
>> +	/*
>> +	 * low ----------------------------------------------> high
>> +	 * [saved bp][saved ip][args][local vars][saved bp][saved ip]
>> +	 *                     ^----------------^
>> +	 *               allow copies only within here
>> +	 */
> This diagram is not valid for arm64. There is no "bp" or "ip", and each stack
> frame can be laid out more arbitrarily relative to the frame record.
>
>> +	if (obj->start + obj->len <= fi->fp) {
>> +		obj->flag = obj->start >=
>> +			fi->prev_fp + 2 * sizeof(void *) ?
>> +			GOOD_FRAME : BAD_STACK;
> This check is broken in several ways if there's a stack transition, since the
> placement of fp and prev_fp is legitimately arbitrary.
>
> This would also be a lot clearer if you bailed out early rather than nesting
> checks.
>
> The best thing you can realistically do is check that the object falls entirely
> within a given stack, then check that that no frames intersect the object. You
> don't need prev_fp for that, since you can just check each frame record in
> turn, then bail out once the object has been passed (i.e. once we've hit the
> correct stack, and either seen an FP above it or transitioned to another
> stack).
>
>> +		return false;
>> +	} else
>> +		return true;
>> +}
>> +
>> +/*
>> + * Walks up the stack frames to make sure that the specified object is
>> + * entirely contained by a single stack frame.
>> + *
>> + * Returns:
>> + *	GOOD_FRAME	if within a frame
>> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
>> + *	NOT_STACK	unable to determine (no frame pointers, etc)
>> + */
> This is the exact same comment as in the header. My comments from there apply
> here, and one of the two should disappear.
>
>> +int arch_within_stack_frames(const void * const stack,
>> +		const void * const stackend,
>> +		const void *obj, unsigned long len)
>> +{
>> +#if defined(CONFIG_FRAME_POINTER)
> As above, this *cannot* be selected on arm64.
>
>> +	struct arch_stack_object object;
>> +	struct pt_regs regs;
>> +
>> +	if (__builtin_frame_address(1) == 0)
>> +		return NOT_STACK;
> When do you expect this to happen?
>
>> +
>> +	object.start = (unsigned long)obj;
>> +	object.len = len;
>> +	object.flag = NOT_STACK;
>> +
>> +	regs.regs[29] = (u64)__builtin_frame_address(1);
> NAK to making a synthetic pt_regs like this. That an abuse of the existing API,
> and you don't need to do this in the first place.
>
>> +
>> +	arch_stack_walk(arch_stack_object_check, (void *)&object, NULL, &regs);
> A void pointer cast is not necessary.
>
> Thanks,
> Mark.
>
>> +
>> +	return object.flag;
>> +#else
>> +	return NOT_STACK;
>> +#endif
>> +}
>> -- 
>> 2.25.1
>>

