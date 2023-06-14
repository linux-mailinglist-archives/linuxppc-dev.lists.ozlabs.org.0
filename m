Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886A730BC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 01:49:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=xwchRnEs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jUMHqgQm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhMZy5lnQz3brB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:49:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=xwchRnEs;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jUMHqgQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh3qL0jkKz301R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 21:58:53 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAJIvq013103;
	Wed, 14 Jun 2023 11:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=b9Yo/zfPhAzgEd5NGS+Y2g7d+SJcdvJUKmPMfCa4RWQ=;
 b=xwchRnEsk19BIOvRZkHt9R6gChu8jLfiWuigh86EPbYdCiUfODqFxFeLaJ1VcIq8tVwF
 mPTmr3bULyH/IMQT9r/lsp8XmkG58GEHBoiYzQwEZ6A/7KfEvjaVuzzNhRuXnm1q6J3V
 PVZQKXh+TmWzv7rwLVBsoFn0iQXvp3h31Dbfg4rqQgyYbtxlwTMVHmq7fBEM7xNrWEMh
 grLPWnRM9MHEnBxt63B9rmysqlG4sXofFyeJipMP14fqgsfBtc+nfFhR3h89bv4/izGm
 9jKjbos3FO6wOYpvKvNrHxDfYyK3YIpxfo5UYtvCtmrzraG5cBIFEhwwOBu/a3fHSmDp Xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fkdq9bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:58:26 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35EAFIVu021624;
	Wed, 14 Jun 2023 11:58:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm5f5fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jun 2023 11:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM9ymqXzaZWqOI1m0Pj38QZCLdS7PjdBn139aQkuBIXmmx+XcinUHfeJIqHcomBINzwcJ0G7vjoFbj5iBR6bdoiKTMQlI9e84w5dj4BCg+BknAkqlZIRQSY30AkdJrwqFbwVwNCTmNcEzacwemzfcZQ3ZvGxN/nbTBS1LXnGR0QrFsFrdjK1/twNhsLHeBEQhR3ecmfeQUq0cjuiVk4K7wWneItSav3Gh9NVPoofGk7dWuFyeaJAOZn/OveubdEavpbkWBdpR7UdKABnKikg7L1kbUOMZL0MX5sOXFmTiMmhICO3+m3F7IdKSQiApUEzDZwKoEZFW43SY1mrLf7ezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9Yo/zfPhAzgEd5NGS+Y2g7d+SJcdvJUKmPMfCa4RWQ=;
 b=X9laYR8wpBb8AgplDP6DF302WyFDky28MJUO1rnbGVlHuZD3bilO3jH9DN7F8uIZrwHvMEEzEu7xhn8SFE/80eLolq3XwJmGHcSqEuM/l/xEvQqBc2Sn7+POOAV5PMXQx3d06nTOC5KkljMRdvC/RlMpXT8txR+H+7JTum3ulgR0Lvx11vF4kEWIWt69JM8rbn4DgEOwsUZb7Zs6tocPlXSnsUMK0x8xuRNCbuU0o3BW7knuNmos5E0Eusu7CZY+QSGoXMOnS4tNn+Z0BRXf7EZQPNXrmhr4KU2x9oVwyDgKC7vWzGKfhiJjs2P6YYJsppsOU0woI9yFxIrtHJwBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9Yo/zfPhAzgEd5NGS+Y2g7d+SJcdvJUKmPMfCa4RWQ=;
 b=jUMHqgQmONODdzIvoCptwFLq4J1QbQr9paCtUf8UidC/iGu1IfXNcbmizIFSv4fsNO+CEUVAQ1EUmGgy//9UqcPuO94dOPjSg3+fnii3Ekqw4LQiHT2xn8hIO6QVRRSWy07Ns42Ie0NuS2BwCuTzJ3nV0lGNNw9Qhz1fOCk+9Fw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CY8PR10MB7123.namprd10.prod.outlook.com (2603:10b6:930:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:57:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 11:57:51 +0000
Message-ID: <0e2f9ee8-4b4a-4b6a-5dbe-5830778747e7@oracle.com>
Date: Wed, 14 Jun 2023 06:57:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 05/21] arm64/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-6-eric.devolder@oracle.com>
 <29427d7c-7d81-9bda-0067-d17b51952cb4@huawei.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <29427d7c-7d81-9bda-0067-d17b51952cb4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:5:337::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CY8PR10MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f042834-7886-44a6-30e4-08db6cce9462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4EgpJa/q4V5a0cb+3ciq1s2Mvr9PFZ/t/piE9xdLQiTEkpiNddzCMCjgXxEM9NkzZmxlCXVmzd990B7fYOojQt+aWkhZ8zwYlXNto0QOamWEG6VJ2NI0PpBYYLomK6OQRTzJtbz4qVIopoMxPCZY3LExHZh2YUY2cqSAz+9PCEA96zReQtTc3g5Mx42fxMhzstIj4tCADvdyUVpI2IYQeJXg5x0GB7ivUCpMsKD5Hc0VP0FTrg/TuSApxcsaRgMz6mHcMmK6vurqduNiZI8vZo/epffnvAW7nnOnT2s4BzyzdymdO9aEry9I8TfPX+IfJaiQ0lkheiGA4+lNJmUHOng7CR9sU/5QtfbxJqHN24JFoOipg1U36sr3VnRXG2pWmIdGfp7zFbF6wc1idfNhSg53/E8JVPQO+hzJxi9Xxcpl3dZfzh20Z9PqeTWeTEhWef2TR9OfcYx35LqLAqmgebAEoQTTObG8kUbeoTv3twBEChJSbSzFoQJqXEL3BOBuSm6CLkSzGLXxiQ+ROuhwvvOvS/y09kLNbRvQxIOWJaVLe9zTJ2gsDpWhEaBtrIf6Mpybv0vEBhnux4Y8Ob3IfHKhbLMDjmxR/QbV5Y1qvXaT0RlckfpL9F97w0rNbm1vxBHNTWqS7TZXrPdaochLRyzA9nOjj+nYuXG+WDlynN8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(31696002)(36756003)(86362001)(66476007)(66556008)(478600001)(4326008)(6666004)(66946007)(316002)(107886003)(6486002)(5660300002)(8936002)(41300700001)(2906002)(7366002)(8676002)(7416002)(7406005)(38100700002)(921005)(2616005)(53546011)(26005)(6506007)(6512007)(83380400001)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QTFEbUhJbEhmUG4rS3o4UWZzaXFzS3FHZm02SW9xNXl4bDg4dXByUGlmdGRF?=
 =?utf-8?B?Y0llV1VYLzJ0cmJxM29YdUVZNXMvdWJlT0Vib3QyT1lZNWZWK1RNTGJLcHpQ?=
 =?utf-8?B?bUpBZ1ErY1hVZGlzdEc0ZTdKcEFhRDRzd2NjVlBmYTJTTmh6Uy9TWW9uY2RX?=
 =?utf-8?B?SXlqN1lJOE0yZEhjOHdzYmI1UFZkWXlndDc5UlNqU3lXeStYajdueU1pTlox?=
 =?utf-8?B?QzV2NDJDM29kUzUzZ0VTeGs3UVNCNmJlckZiYkpWNTdmd0grWEF5ZE9nNWRH?=
 =?utf-8?B?bXVHbjBVazJEc2NrRXBQSG93YWZNZUpPQ1dpL2p4NTdFOVVFTnpZWU9lS3No?=
 =?utf-8?B?QURyamllTllldkx4TXhsNzlFdkErSEluODY1VEwySnB3Y0hJbGN3VkJOR1Qy?=
 =?utf-8?B?ekJNS2Y1eHE0c0VJaktaaHo5dGpsbllOZVp6MHdUTDJVMVQ4enJiVEZoSkxK?=
 =?utf-8?B?Z3FGZ081ZDREWVR4MHF0bGRuQjBYQlRXMUlWQ1FVVXJweVo2WXlxVUJvVTBK?=
 =?utf-8?B?VVh5UjhzeGZhSFZBZWpNeXV1QzJWR0w5d3k4eWkrT1REWjdMS3lBY3JDNDVU?=
 =?utf-8?B?LzFjcWhYTFJzb2xESE0vVWFUd2toSThOZTRiWmdTVm42NmdGOHRKakFsM1BW?=
 =?utf-8?B?V1hMQmpwcFJsVzlXN01IdGRJSkpUdTd1ZjB1YXZxOERFNnV0RTB6SlYzZW9V?=
 =?utf-8?B?WFR4LzRaNThUK1ZodFZZZFNPN1JLZGQ1NDJYYThQYzRuVWU3WXgwSlA2UlFH?=
 =?utf-8?B?cGk4cTNyQnlDTzVHY25HcXM1SG8xL252MnJKdHo3S1pTOGZCYkJWSUhBQ3dn?=
 =?utf-8?B?dUNYVGxMMm5uU1hDYmtRYkl6aUFVUFdEWlB0WWd0bVltZTh2SVkySGhMQkdQ?=
 =?utf-8?B?dmVoYklnc2FjbHJBOHRDRmpqYkkvcC9zRk9RQW0rQktuZlFlMGhvT2Y5VVJu?=
 =?utf-8?B?MjFjdFBBQ01xR0tBeC9wWmxtY1dQVFBzamVHMWZRYXpYZUZuUWJ1VnRiTkNk?=
 =?utf-8?B?VEhMV0hsTzJBNkZya1NZMm5kZVovTm9HeU9jWjZGelhNeVFVdVg1WmhwcXcx?=
 =?utf-8?B?d2FxajcxRUZzaUM1TXdid090YzZUc1FXeTJDN2VlRHBTNWV0bk02eXEvSnVR?=
 =?utf-8?B?Z3F1cU03MkFwanF0WFJGeEhuZ25QQUoxaDg4VVkzbWM4Z2VET0c5NElYdTND?=
 =?utf-8?B?N3duc250ZjFyWHFjQ2VQZ2NMdDFSekI5am9WNi92K0gwYi9iOTFpUWZCTCsy?=
 =?utf-8?B?VmhoRWRLL3lDdE1LV3BPUjJHL28wQUZ1ZklXa3R5U0hXRXNPc01TdTVOSWgr?=
 =?utf-8?B?TkI4U3FGNkVBdHQ2WFMvSk1WN3d5czZKRUtWemZZN2JVWkd3LzM2ZDdHa2lS?=
 =?utf-8?B?Sm9sTjBpRllEUVBwOE5vSkZxcWxEaitEY2hydE92Z3E1SmhyMHFRa3lsMExP?=
 =?utf-8?B?ZEdpN0s0SlZSOVk5THVqclVEVCt3dnNvWXF5Ui8xQjI2STUxaEM5WVJ1K0RW?=
 =?utf-8?B?WU5mZk5iVStCWnQ5bGJJS1RBV0dieTVMREJ4eXVPUVZVN0Foa29Cb1VzVm1G?=
 =?utf-8?B?aGR3dmFocUFMTVFoNHNGdGlJWC9mRTh0UUVmam51SlVra2VoOGpGeXNkL3ZQ?=
 =?utf-8?B?VjQwREowMk5xcVZqTHZvUUVOakdTSDV1TjY4RDlEWkRqV24wTW5Rd3pVS29j?=
 =?utf-8?B?OFVoV0xKNk1rRkY5aFJWdm56eFI0TjdLbkx1bEZoL0F1WlpnKzU5ekVhYzlu?=
 =?utf-8?B?WW91UHZJZ3VGQ1MzWDRaRTlMUmdld1BrRnQ4R3MrTnY1N3RuNXFTUWczM0Mv?=
 =?utf-8?B?UUgwMEx0QUhxMms1b0dPcXJvOEFUMENTSWQ5WUdjTXVxNm1EUTJ1ZE5zUWIr?=
 =?utf-8?B?NEIySnl1TURSM3pjaE9kdlBoei96bFdlUlc3UUVFSlY1L0lUdFVNQ1doREdG?=
 =?utf-8?B?bzcrdTFCUEtLR3VYTytVTlRiVTR5bzFqcHRaWnBCajV6Q2xBT01KUWpKcnJN?=
 =?utf-8?B?OVJ3OHh0UzJDNHBSQjRTcEhFSFYxeGZNRlpyYW9EWEV2enBtR2oxcXZ2b2Ra?=
 =?utf-8?B?dDNIbFl4cnR3NjluVDNuTDBpYU1uRkxIeDdXVE9IQzB3K01LbkFLQlp0dE5U?=
 =?utf-8?B?WDV1L0JXN3F0TCtDditZVlJMTlRvVW0zeE9sV1BCenh0U0Qvam0yb3Jra1lW?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Z1Y0OTRQSmIxL3k5Mll4aFUrV3lvOXlpMGZjbXphQnJzT1VTQSt4M0dVVzhC?=
 =?utf-8?B?bGgyanVTNVI4MGVldHJjaWh0b1p0azVoLzVxMWlTRk1OOWZHcXZXM0QvYVFE?=
 =?utf-8?B?UGlXcmhvaVBXNyt0dkdTVTBXR2kxeTBLWW5nalo4dlUvajVuZzIzQ3FpZmdR?=
 =?utf-8?B?OS9PU05zQytNYjdUaHZFNklFQmI1MWdFa0FpL09HNTdiRURabjBkQk95Wks2?=
 =?utf-8?B?blJmandOVXJrZ1lnV3NUVHBsbkhaWG9XQ2sxdjhzSkNZVTg1SFJxcGlINDNB?=
 =?utf-8?B?aTRGdmZKc3dLQnZkUUVFTmdHWlFQaXFxMGhFSnNHNCtGTklEQ0k1MGJ0elpV?=
 =?utf-8?B?bnVjbVAyaklxVCtqVWpZeUhwcC9XdTE5UXp0LysvZVJjeVBjQVZiVGNDUktU?=
 =?utf-8?B?YTV6OHg0S1dQTDg5bW96R3lHUzF1WFBkVG1OTGlZM3BGTnZnOFR4Y0tHYjUv?=
 =?utf-8?B?THRZTEtuRHgzTEFaZUVTVEY4TkhXL2ZrbC9lTFJYUU9USGZsS0RGcTk1SU91?=
 =?utf-8?B?WkJjNWN2NGc4NTN3TnRFRGk1L3ZGNml1NFlpWUZJWlpDMFEzT2ZlRHRjWlRO?=
 =?utf-8?B?ampCS3YwN3MxcjN0QW1QdCtIZStNQ2twOFRvMVpFSEVJYk9TUExyd2JORnpx?=
 =?utf-8?B?QWFLZ2YxdTRjL1RNTjY3VXpta015dFpPYm8zZVZ4aXNWSVltVDlqU3pMckVp?=
 =?utf-8?B?TlRJUDB2dnVmMFhhcitqL016b1E0N1dSM0hzYjkxZUJ0aERoRy9IM1RqRlg3?=
 =?utf-8?B?V1gyZTBVekZ1S2lWSjNMM2N6cGIzRTJOcE1oTWZzbTM5U0NhbFhIbElKMCtr?=
 =?utf-8?B?TW5KQVcxOE1Zb0FSWEJDcW54bWowenVmUDdIbUt5SkZlZnNiSEVqUnRLWW56?=
 =?utf-8?B?eTlZS0NuUnU4WFVMNTlYdUZSbXlpTHl1RlRpNWJiTTROWXlzcXlUMzZYTThY?=
 =?utf-8?B?SXJvNTlIbnU3MTlIcEhLUjV1Wmx4SW5XN2tNcnJDSzNtNmpxemRJOU9qeHU0?=
 =?utf-8?B?Vy8wTEltclJ6Z3lHSjBjWFh0dnVKQjBWL1dYUnNYWlF5czM4VTRVU3IxV2Fi?=
 =?utf-8?B?bWhNZVNmVWVOWDcya0ZPVWtvKzFvZmNHZ0xJTkF6dEhjN3hNYzVrbEV0NHZh?=
 =?utf-8?B?Q1VQNUNPSDBYK2M3S0RpYkp0eVhnZ0NybkZ6bkd2WnMzZ1M2RXlPMDYzRXVk?=
 =?utf-8?B?bStlRWxMZWo1Rm1nbXp2VXFUNFEzaUhGNDdRUDJyMk5lM2k1eFdDeTM4MmlL?=
 =?utf-8?B?ckIybEtDb0RKb1luM0hlUk9oQzZHd0ZpWlRRUmUwYlMzMHZWYnVjMjVmOUxD?=
 =?utf-8?B?UTIxMlp1M243dmwrTXk2QkU1aVBRaU43MWF4RTNCTTdaQmpJYWZUdTJZUmtK?=
 =?utf-8?B?ZmN2REpVZzdZQjYyYThidEhHUjdiekdGaERPM0N3THNTc3NLblVWMC9ocjk4?=
 =?utf-8?B?VnRIbm9XRFluY0N2Z0RxcFF2M3E1Q293TWRnR1pJT1NvUmxUQVJwMVBBWGFN?=
 =?utf-8?B?NEVqbUV4RXRIam9EbnBpN1JBWTVyajRVYUMxSFN2YmR0azdxRlQxVEl0VUtV?=
 =?utf-8?B?SVM3dU9pWjdMdVBFWFhsL2ZoRjg4ZzNNMEVYTUlraHlLUzQzVm9zWTNmd3VB?=
 =?utf-8?B?Y2N3Q1JYcytlTTNwWWhmM2x3bWhwRjd0eU1pdnpieWxVUkR1YTI2bFVCeTVS?=
 =?utf-8?B?UkFmTnNrakxzc0s1QTg1OVNNVDRBYVpOVUdha0lDaURyNkRENTdrTVc1Um15?=
 =?utf-8?B?V2lKUktvN3k0bVFTdGdqVVBDSThWQzVSSGU3dFJzUG9IN1pFZ0UvTEx0RVN3?=
 =?utf-8?B?TlpwcXdXN1habWNYNW85eGxHTnJ0LzcyTzk2ZWN5c0NkeEhTVnNKMTJ1MzVn?=
 =?utf-8?B?Y1Y3dnduOENEVFRNVUFyZ1dMTGZTL0VkS2IwR2JlUEQ2Z1VGbDNNaWZQMGVZ?=
 =?utf-8?B?cEdxaHBidEZXRjErQWZVUld2MXVZLzNlaFgraThtbVk5SEpZdTJVdnczdFR0?=
 =?utf-8?B?bDJ6djVHU1F0ZFVuSWQxenFIL0wrbWtMSm1nT1R4L2hkNDZ1a1FTY1N0WDlM?=
 =?utf-8?B?QkhsSTZyQno3OHFKcHNSQmN2Rno2dWtxcXRmTWVDQW1yd3pYVnpJV2RTSGhx?=
 =?utf-8?B?ZUJINUN2bExScENhRGM4cHB2UlBmNExuSzVxY2lGODJoaE0zN2FzMGpBWXVF?=
 =?utf-8?B?MmJVVklYSnVWdjZrSFdhMjgwWXh5SVg2czNZRjk3NW91ODJmdEd4eHNnYUtj?=
 =?utf-8?B?WVNGTFhUNjE1SmRIY1VMZGF2b2FjYmk2Q1FCOGhUMmJmZVhIQml4YWZMeXZB?=
 =?utf-8?B?eTRXQUwvZ3o0cmg1WkxxTGdOb2pJQnQzb2FHZXQrNUR4UU5ZK01zZGJlYWdC?=
 =?utf-8?Q?jTIKZArGgVtSt8/8jqnhcmKgzaVfGyf5yfJSGCFECn+It?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	ySbe3JJHRhTKNTBH9WcZv/kqZxAGfjeqfINkm1w1E2TVY2fswl2JWJj2g4+ylfPuCe7qlWbdQhBJw0qQUIXVKIVq0df6nQm8wlM56epcWhOdDFnGFetdOqCqDPamC2OsX7BPU8+bnTUmikMJLcIcI27W0YfvZVAvIApKx7pTL788+WxEadmGhCEyj5iamKxoEDM25MWWdcFkQTDkzSXP1iWJxAMbXpsOhpgoFsJ850xM05qs8fl6ps3m68gqqN4ZW0JpTJwzOKDF8YE1A+ajnMLh6KLhKvfHTGbgeC36CvslPNwiGxJSrE66psdjNmFi8tKyhhcdAehdjH0egZYJjTXWKZ1DCLYifef+9uDTN2eNLyMhZgdWYvvI7Iy47gnDD6U+L0Wqw7zHTeBmXYtmF3Am2Oh/TnJdomXW0z7mPRRNYkQ9xjSLAUFdVc2fZ0vnqNjnihJMDqNyjQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f042834-7886-44a6-30e4-08db6cce9462
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 11:57:51.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzETc2oC2lVCZATjw+ZA2KCmL4MnSyyr7KamSxVPGYoaH70KaDs1iq8UBx8feB0kkFP8ggOgLXew+zOoTDbf0uuHu1SE0eIakRpfeyBEpZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_08,2023-06-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306140103
X-Proofpoint-ORIG-GUID: LPbsoxk9yiE-DL4hUdUU_g6xSleTj6fo
X-Proofpoint-GUID: LPbsoxk9yiE-DL4hUdUU_g6xSleTj6fo
X-Mailman-Approved-At: Thu, 15 Jun 2023 09:47:36 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/13/23 20:22, Leizhen (ThunderTown) wrote:
> 
> 
> On 2023/6/13 1:27, Eric DeVolder wrote:
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/arm64/Kconfig | 61 ++++++++--------------------------------------
>>   1 file changed, 10 insertions(+), 51 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 343e1e1cae10..33552476a877 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1433,60 +1433,19 @@ config PARAVIRT_TIME_ACCOUNTING
>>   
>>   	  If in doubt, say N here.
>>   
>> -config KEXEC
>> -	depends on PM_SLEEP_SMP
>> -	select KEXEC_CORE
>> -	bool "kexec system call"
>> -	help
>> -	  kexec is a system call that implements the ability to shutdown your
>> -	  current kernel, and to start another kernel.  It is like a reboot
>> -	  but it is independent of the system firmware.   And like a reboot
>> -	  you can start any kernel with it, not just Linux.
>> -
>> -config KEXEC_FILE
>> -	bool "kexec file based system call"
>> -	select KEXEC_CORE
>> -	select HAVE_IMA_KEXEC if IMA
>> -	help
>> -	  This is new version of kexec system call. This system call is
>> -	  file based and takes file descriptors as system call argument
>> -	  for kernel and initramfs as opposed to list of segments as
>> -	  accepted by previous system call.
>> -
>> -config KEXEC_SIG
>> -	bool "Verify kernel signature during kexec_file_load() syscall"
>> -	depends on KEXEC_FILE
>> -	help
>> -	  Select this option to verify a signature with loaded kernel
>> -	  image. If configured, any attempt of loading a image without
>> -	  valid signature will fail.
>> -
>> -	  In addition to that option, you need to enable signature
>> -	  verification for the corresponding kernel image type being
>> -	  loaded in order for this to work.
>> +config ARCH_HAS_KEXEC
>> +	def_bool PM_SLEEP_SMP
>>   
>> -config KEXEC_IMAGE_VERIFY_SIG
>> -	bool "Enable Image signature verification support"
>> -	default y
>> -	depends on KEXEC_SIG
>> -	depends on EFI && SIGNED_PE_FILE_VERIFICATION
>> -	help
>> -	  Enable Image signature verification support.
> 
> I don't see an alternative to this option. It's used in
> arch/arm64/kernel/kexec_image.c:135
> 
Good catch! I will move this into the common options.
Thank you Zhen!
eric

>> -
>> -comment "Support for PE file signature verification disabled"
>> -	depends on KEXEC_SIG
>> -	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
>> +config ARCH_HAS_KEXEC_FILE
>> +	def_bool y
>>   
>> -config CRASH_DUMP
>> -	bool "Build kdump crash kernel"
>> -	help
>> -	  Generate crash dump after being started by kexec. This should
>> -	  be normally only set in special crash dump kernels which are
>> -	  loaded in the main kernel with kexec-tools into a specially
>> -	  reserved region and then later executed after a crash by
>> -	  kdump/kexec.
>> +config ARCH_SUPPORTS_KEXEC_FILE
>> +	def_bool y
>> +	depends on KEXEC_FILE
>> +	select HAVE_IMA_KEXEC if IMA
>>   
>> -	  For more details see Documentation/admin-guide/kdump/kdump.rst
>> +config ARCH_HAS_CRASH_DUMP
>> +	def_bool y
>>   
>>   config TRANS_TABLE
>>   	def_bool y
>>
> 
