Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA37490DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:15:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=TkZG978Q;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=f1hf0ir4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDVf29cwz3brl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:15:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=TkZG978Q;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=f1hf0ir4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx20X5qqtz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:21:48 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDxdC014216;
	Wed, 5 Jul 2023 14:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/pfD7uBPmbtcD9dRNPZWZ4kR+jZnmb8tCIFetA2p17E=;
 b=TkZG978QJEHzAo1xUpwyRbro8S0G/1e2WfhLS/Xp7AXS3RCX+nskSyVj3cEOV87ahT0Q
 8fDczRJCuGYqWYkAZ9xdW0QcejgjpU7X1nV1eoPgJiCOJTsYO/5N5ZcZxl9DrhkmiKHq
 rk4LkhhlKjesmj5nspXjSBbM684M0U8i8K9Q55rEXgnluZuvv2NzMXuPMYL6ynAV0rtR
 j2LsZ/xnOUBsiUo3NFOfSWPSS46EpEWmJOAoGKoBzn/4EptGWxbpQz15r8GwJZPvTs/v
 /+j0LHKJ7sbBueAUlTLpCRfw99tXr0Yw98d+tkqh6kZ2RDEtOrUTa5zIViaxAX7AzWT9 ww== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjajdejus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsPD007181;
	Wed, 5 Jul 2023 14:21:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakbnwpn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/fBr3/z9r24RdfH/xOvTRni+rhdHq4sh9H+0i52S6hfoMoH04peleQWWx7Cu22wGFOPe7z+deKheNjVqktm2V9/CskaUL/SYOKTNVqKPsCIk/B/rhsKskUVDUOI3OFOAtj060ixpND2mI0MQohHCSFCYuk9IKmHPuSY1de8zkcXWwfHT/s5hYD3obGzEM6mfvBZMUbALlUUdkBcwl906Z7B20iiw5CdEwihW1Aa7k4KLbQ6Ice1Qtls/gujfAcCTsALP6aTkPjOsKxp2bGsU1nSLhAuLZU8rDUHSWZ8vyTTkCvYm4+7DF4/6iydlcrU9/6v5QFp6boS66+gVoKFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pfD7uBPmbtcD9dRNPZWZ4kR+jZnmb8tCIFetA2p17E=;
 b=QjQIFwBIDvEfoTMavK6zZZ/zunk3mcCgc1zDuhhPG7IL/rF9Gqm/OJbUiaSLajxFm1ylMUgMHAs+VsOHywge3rvxdfBIjedA4Ep4Vw6pvR++VxUM/qqteg51vHrSs1lTgjGmr0GA4oKHUgjUqCkkG+e2E5Y388h/BKGAyzXI+ft4GMR5bE3E1rjbbaCnbVx8cJUc2M0g4ez0wdMHAhJxT557oxLsGnrt04Qxv4NZqP6Vc+BP2ObaUvz1XItSEic3V7O7l9wCR7Kd4wa56ofV2RttA69F3Cr08kPlc2ef6i3FZYS7kiUSGp6qDthYVi0kG+hbrAvllbUgaAIu7JVsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pfD7uBPmbtcD9dRNPZWZ4kR+jZnmb8tCIFetA2p17E=;
 b=f1hf0ir4kRHUW2FpLp7fEm04DPOH7Fl4Bp9BkwnRrumzlmxF0Mh4YNDjSxVredBTaGG2hSRuI9fYxpQbnB1eNp8lsjID33OqgDbnFWaNg5K45eWVArT2zUQw7NN0twRd8xV5awulJeVnqSrm/x83UVFLFz5E1URZ6htUkStEWp8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:21:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:21:02 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v4 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:20:03 -0400
Message-Id: <20230705142004.3605799-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bdafbf-8b76-4acd-6d67-08db7d630fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kEwpWi6CxmJDMw5eC6jJ/kZ4SNCXe8LeTO6Cl7mOnwlpGTiGuRAIVEM7v911SJWUTvF4u3zjh8KJRGdh9vXMWf3/gvVlzaM3Pqe+ofnf1Q6NrVA3yZBD3yRPPvAu9HwmcW3NL3F2Y2FSGN5vrfFIDvkH4kKaFqWb0+uvromhXnZxqgUNYElOzDM2DS5bBb3EgSHkZNzLFExv3nhYI1mJ5DXtMrXB35chJ+0mMDRyCEFH8oyrVtNdULOFNNEjMvKFn5mUX4wtUrhxDPHNMYifBogw1nbfmyCf1icNU/aAoryYvXBsEb1HD50Wj+vhOFxjT39AqyPF0B4WuPKwRuG8rHDhtPPaWJYskyw+bTyGURGUF0AfE0p10nKsQA3JsM3JUleA51R0HbQXtDx3XKrhc3cO++wXuJk9qRGbTDVPWhq9c3l6IyjFd/ND/3zxFWSfxhMCStRrrTNbS4MmNKqDeQ/4MT00PlSIjwIlKC3oPtcLG1F1W8sGrnefdSUKs5A6Rord9dGCBMNqn/NeY1TdNphV1hKua7qcJjOaausulKnrfClM9XppUE9SPv9KMdLHjb15+LdR38ZgF1BS1Aegjyj1VDmD/+3Z1eaDDhH9Z9A=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(41300700001)(107886003)(921005)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xfX5XX8kpBg2A98yxDxJpgsdIFpykOwhnz6159PnSZxDi88AgV8Tc7GwCJFq?=
 =?us-ascii?Q?+pCmailDZOkeBJfuGT3l5lU9mLrx9wxCd3HtjgG4eKKXTMZlp1HD3phvOGcg?=
 =?us-ascii?Q?sdgpDDqzJQp3b/xLSS998SG2JuBy7orLSlDxFMbn56qNCoLg79sqbRARJqZB?=
 =?us-ascii?Q?0PkDT/R6vB5Q9t7xQepsq6lq7k0Yndg0bPvOsdzAoZ077oURbLjMrOdtZ/lv?=
 =?us-ascii?Q?myhse3zYMJ/DKJhMvKp3X5NkbmR5R+SvkOL7j1mvV5msJ4bcHmi7ZjsywBJ8?=
 =?us-ascii?Q?NG9KKBtZGNjyfN70z76os8gqDYokvN6eWEwmkc8nNu8R9WetlX67yj8wA8nV?=
 =?us-ascii?Q?OrX2+y5goHhTYDH3501QdbD9O7MnlQd2B+mfsaNHL0qQJWiDSQpSu0/fAz7Z?=
 =?us-ascii?Q?cc+ejZYCybTCt5zO1V7IX5bnuCyHsKLI4N2qWPu93kKZYEWJte1kwdtXm8gn?=
 =?us-ascii?Q?M94mvWXxGXQHTUE1Weq1nx8Nk59Dwakdb6RC7ZhUzL/dSfyi6ajuT/vJGD4+?=
 =?us-ascii?Q?a9DrVjy0GUtvVdU5OidzLXP/oocnDFKSBfDCfBocWWZZmAx7yfiIvF037OwO?=
 =?us-ascii?Q?Tc4gbqbmet+LjG5J0NK3uGneh9Sr4AD7iofMQRP/xbnLcExHExDUKWMsy5xx?=
 =?us-ascii?Q?jZXkvpXvIkNvcB1zfNXQLYgtTBhYigM3GdxwltmDj92+Zek3Luvu1G6RySg4?=
 =?us-ascii?Q?5dnbACeVc/1rCjPWuZyoPC0cCKmnlc+16qS0wfrcvd5rkPYJYDdUVErtMPF4?=
 =?us-ascii?Q?Z1MD0d9HC8A4bWFAOUh+VnmlAGqjeQtsUv55PfUyJinDkd9faaaK1MmDd+RQ?=
 =?us-ascii?Q?V5WJbjwb9KmitdEbbOEWPb5lNkjTvZVTZrwwmDBhPabGa9ksCNDfueO6qmMu?=
 =?us-ascii?Q?2Myvvz4FY0gBwq9pyaVLLrq0RyW3BdpD8UuRypLd0DHaEmskttO8fXOpG2E7?=
 =?us-ascii?Q?KH6L3BZeReTiS9KGP1QE4YjYixX7dIYZy1uzn1ZwdcrTyFT4bk6M/mINBl3W?=
 =?us-ascii?Q?D4krdCjBow5JR3xH9XjWJPQS4ogH0oH7cHPqFoHw5CxSyuDMUU8w3klll3u0?=
 =?us-ascii?Q?YtgQ8h33nrR6RNgTII0VTXR8pGYsmrlMjZbZG7hgTQ29AtPrAchSLzQXjirY?=
 =?us-ascii?Q?1IEQjYo/4j2HCrL0n+dfWV4nws3g/yLAvr7QP6kP8J/SOQFwMejK/BF5nVD3?=
 =?us-ascii?Q?Fy/fLJb8tZfaMg2a8/hnirF+LDX4y5Rjffx2+ofxY8onoYRqo+e4kMS1z20P?=
 =?us-ascii?Q?Q1tzE1fa9O2Uejjc6IvOCwCaNLC8KxsgJK5/anlxhMqIT7AmLTMBIy85D1kU?=
 =?us-ascii?Q?KdBNrRM/q5muss+GMZhnN3+dwP4TM8HNLLsw2gjFCS+R6JzSE2uZeZ2TT1kl?=
 =?us-ascii?Q?IHwnsPSKdckNsS/UC2QunfaLyxrRZKdyNYNxrpxA2zPXd9xDdsOKUgGBSwjr?=
 =?us-ascii?Q?34A26DawslwTgFVSH2KSgj9aYsuk+k9Vwp0Zd8C8NNzb8kPu5oYBWCzSA70n?=
 =?us-ascii?Q?nqqwzdNE2Reela7zKUz3rm9cx44WtiNRW6FlMjb1jitC3LW/Z7OGg6gz6bya?=
 =?us-ascii?Q?+kudSK0NxIGwwHMq55VmHbdra0ZtmZpguoUxF3RJuGTslM4z39wXa2xCnNcv?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?wL3GGOAPPks6KUADfB9lfIMjO9JVpLgS9DrPl7E3I3wS9e7u8kFxUEez6jnL?=
 =?us-ascii?Q?EoW8rKzDt9wHDnh6sNz7lKnCp3LION0MGiDZRyJ7TolIVSOIz5aMaWN4dhBN?=
 =?us-ascii?Q?bAuyxsnp9rCC5hHLVI3U8895OLoLCzcJTZpnl9RhUev0viWKo3Mcx1AWtrok?=
 =?us-ascii?Q?BgVfeQM47Pi+Z2mfa2I1kc4lQoB9oAp6oKbxxzRv57Tve0dusiKF25lNkZoG?=
 =?us-ascii?Q?XdGC1RbTNW5Dlo243PQNfX3OBuCUSLwVMaun74TkwRD4FekOtiaM39sjXyD8?=
 =?us-ascii?Q?NvXQghqKU6Pi7WurEn50wJnxJDAraRZczTiGVidn+vgPGIBZzCJ6EsnQjuKy?=
 =?us-ascii?Q?r31v9xhYpTgb4RZ+1VTEnBfN5nYlNkLaXDgUasNIEYxwyWwQ0zEOkoZxro/l?=
 =?us-ascii?Q?64IJBcmsRCMyEQ98LdVlQRkl6ajyIewSrv0GujkyXyvv3Vw/xfmXvN5a8lfh?=
 =?us-ascii?Q?7XiyU1tynVKCxRb7ngRD2NA6DJYm3ETtsE5TDFjpMNS/UWzkSkXSRluY4CSX?=
 =?us-ascii?Q?Bbc92zTS16yoFP5xqfb8arx180078hE1iVEBdVJsvJ3yp0GgumT8Bsl1u7z+?=
 =?us-ascii?Q?qmTqFMiGOOEu7Kt6soohqN5RH3AxIVYfCv3d7gZ6GagPZ7E+9AynLXjUD5td?=
 =?us-ascii?Q?h3zEIt0OXbRv0ISEj9OngKepHaBQBv00niDLOMu2xypEpBFn3QWKql30xXlh?=
 =?us-ascii?Q?lK7JYZ5fXhl/bHzcQs7a0QhJOcUPuPZT0H0XfCpDB6dzmcKrABwihwS2w7Ji?=
 =?us-ascii?Q?DJxkrm5hXxEQ4K1NUIsDoJj5Xu+M+sH5c3/ceHmCUhrJISqOV/RE4GLWaf4h?=
 =?us-ascii?Q?fDRI8xDo+8z+r9qCvZOuMwb355/KMwIeAQJ0TxwD3DxPlYQrQdD3w98F4hwx?=
 =?us-ascii?Q?j+jIbGWcAPB8V27uswcq4iZKiLbLX6OwN2mxmlDGADKmRYt24hLuB5Pika7c?=
 =?us-ascii?Q?VmfH/4Tgm3DGVfPPwyWDGZyd8xBdaEVUv9BgRe0DkHvezGRwqvYiFIdlisSR?=
 =?us-ascii?Q?czxk+6Hefk+lE4eTBNu2GETCBg3d2D1JPxEZE4yrGaRVkhnb4GFpM6X1pII5?=
 =?us-ascii?Q?SHqGfUZ9GIu85C0MNOCgI8L9DTdZv3pcxkLsswxC70fLMtYZeTxP+OiMaaL/?=
 =?us-ascii?Q?jRYr5wFB2PuQkqgUdW21STymKBUqGiIAj9CjOKvbUnqjRw263t0O3S54nrMC?=
 =?us-ascii?Q?7+zE6t5/Isv9FjhoAie1KgFX8fszPFoBe7uS4ZoM+ZXUdFTGcJs0FE0IwBFK?=
 =?us-ascii?Q?ZQRbzF/arM8P/uBYH8p1BuiMsDCXIuc2pgtXvYF0/NYdjFMixbYsBOP/p9/O?=
 =?us-ascii?Q?66cVxxu0QBby4L7hR6bNyQ0QG9fWszcKpp34ldfvRyMCuTzS2cU/+dkAgcBb?=
 =?us-ascii?Q?PgD1LS2ZrAmiJuVtnnibMlYnqTLSrnycuebUN+1LnPuJOzX/cWX6TGYNpGsd?=
 =?us-ascii?Q?aZi79HydxVymouhBwG/0UGZlz6eLEjrY/OHYCULFYr/VJZeTXfHAkApm7PpS?=
 =?us-ascii?Q?6b7btNERtPxIsRtfiGSSAiP6pv5SAP9iKSBiGLuOAmt3UeBn+735FXbyItF6?=
 =?us-ascii?Q?bbfwA0fbr4EA09jLcBF6EMZ+oaOmo+ZdswiKwQLmWJbcIpHyc1rMA6nEpX6b?=
 =?us-ascii?Q?dEs8FyMisLpToW9Bzv8E9yoAHEhbGYQDY2X2bFfMpKLjo52nQf8+GKI4EXHw?=
 =?us-ascii?Q?4CEv15NndMIpNR/33cnExkNXhIEeq4jW1WIJ7HJbJCG5YMHS8cct7U1Z846y?=
 =?us-ascii?Q?y9ab8QpisevpPqv+Fm5JG3KWyi4LOEin3CMXX2VI8HeRlaaq9EycZ99rHRNn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	iyR4IuLrdKvG1kt58lqBhUll5Pfy6PaJ7yD+/zCaTl42pVVbH6bLe1HfjkyQqQb9BssxIqOCnXtzJ7CMrVBUYixdZHUFa+FghCEN2bGr8JxSFxdwUafy+uGIiNRNgoAyr0YNmmo2CSnyswyrbV2HvNdZFpr3moHnnPba3U0r2/CsbtkdXznbVRzReGoOuEZ8IPlaRPrArXTf27JhTmAjY02PB0fxtq9mOc2oldZza/ML0RaU92wV1iNMrmlYALQSsAg3QKYkoLs1I563gfpHxFgtWQY7/qFO+bHNfIitio4PVkgL0ySX4j4pHwNkQq1nanWH7kFS+xX2ffq65L1Wmi9CuTTVXOe8OgibUkLOmDbaB9DGTlV9N/sEvhCSUK30GdSA1j8LRYjbdqqBf0cE8xpkHcwJFhxg9HI6EbqdmsCZ5fF6U9zc33B5Q+D3e2VfUM/ExZGNyGjs/w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bdafbf-8b76-4acd-6d67-08db7d630fba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:21:02.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4LBtSjvbmpZpUxx2srJnS3VhtTp8+vtWZYBDnX0hRv3qBE0TJdIdnaEQ21xJNk7CboSb0u/aaxXXCTPkO1Y8ZNAKM+k3oGFD9sSpWdrfXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-ORIG-GUID: XAFDxy3AW61eSIf4A343eXvhyhyjLfoR
X-Proofpoint-GUID: XAFDxy3AW61eSIf4A343eXvhyhyjLfoR
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

NOTE: The original Kconfig has a KEXEC_SIG which depends on
MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
dependency (using the strategy outlined in this series, and other
techniques) results in 'error: recursive dependency detected'
on CRYPTO.

Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
dependency was introduced with [git commit below] and in fact was not
necessary, since s390 did/does not use mod_check_sig() anyway.

 commit c8424e776b09 ("MODSIGN: Export module signature definitions")

MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
MODULE_SIG_FORMAT does not hurt."

Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
from KEXEC_SIG. Still results in equivalent .config files for s390.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 5b39918b7042..5d4fbbfdd1cd 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -244,6 +244,25 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	help
+	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  This option also enables s390 zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
@@ -482,36 +501,6 @@ config SCHED_TOPOLOGY
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	def_bool y
-	select KEXEC_CORE
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	depends on CRYPTO
-	depends on CRYPTO_SHA256
-	depends on CRYPTO_SHA256_S390
-	help
-	  Enable the kexec file based system call. In contrast to the normal
-	  kexec system call this system call takes file descriptors for the
-	  kernel and initramfs as arguments.
-
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool y
-	depends on KEXEC_FILE
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
@@ -733,22 +722,6 @@ config VFIO_AP
 
 endmenu
 
-menu "Dump support"
-
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	select KEXEC
-	help
-	  Generate crash dump after being started by kexec.
-	  Crash dump kernels are loaded in the main kernel with kexec-tools
-	  into a specially reserved region and then later executed after
-	  a crash by kdump/kexec.
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
-	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
-
-endmenu
-
 config CCW
 	def_bool y
 
-- 
2.31.1

