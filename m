Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18B72D006
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 21:59:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=jFlGCpPy;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bZjmVEVK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2Zp1Pbdz30fV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 05:59:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=jFlGCpPy;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bZjmVEVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1380 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 03:52:09 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfzls1Xgyz2xq0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 03:52:07 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNuNN026608;
	Mon, 12 Jun 2023 17:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=vED0vM0rUFE1/R0ZEFiOpkkcyhoFTOCtE4HNXD2bros=;
 b=jFlGCpPyvt8i6vaEO4zZ0BRsjTyO8h6m4S0rpAaYoznkaNij3ZQAKuIH+J4ShZYaoixp
 ZVuwRclvB7OaKB1XmdxS4whpo8OzHBHeR1Yr6m562JQr6rfyhW9L3s9hwr4Mt1rr+LF9
 7nbHVS0ouee4u8k0DY7zNrRcsF7Rq4A0Rfz4RxjJ+9KwgaEt0c3Hvr6Oev4ZIz4L4dbt
 W7hVfcSeyygXr+obSTKL/8wCCsPZKrx9DTokM9zapgvBxAv+mWl5uUDplNMf3CvKXUfe
 GVR/JLPmW2dobPO+kC/MW13rmkb+1X6JJG5AJm3h9R0PFi4lIpOz59781lDkRi7OspYM FA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fs1ujrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4MlA016344;
	Mon, 12 Jun 2023 17:28:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyQY2xbQk9PLsFVK8DgWpo5Eekl3KazzmIueIxA6XzpSp6jC8wlb1mrcf86gtm+13yBYbNCaJ58sxqgft5CcG4O1jo8Q7Qi3++jb/y23P9m/FwWllOSwO1RsiBtvyzgXKNQjxfTd7I1DxNLv7DD/Mt6cOz4Ugfq8mZFTn9UF0njBY1tlsoTByx/tRydZXwF9x3gOvNafmDoGqqPI8ZWzNZ5ec5udHEoB9Tmvo70K1zAJ9wrL2B69fLkz40IiBHiAtZKp7Yw19QdgivCzI+F6cesGSHQ/GN1ndEArlGEDn7dfHxph6+SVKvDrWDDnmT1MMLwk2l2rEC7CjWxaIcP6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vED0vM0rUFE1/R0ZEFiOpkkcyhoFTOCtE4HNXD2bros=;
 b=fYkHaG4PFlWLC41gtcNiFYy40AbXflV2oYPs1cvHp5R+47UpGFWWQxjA/ybXWzZq/c1GD63bcRbvrOFPAq2pIdfx2CiFLLNXqQHgjXAO9voOW/Wuf54Csrrd6iGNEPTawIUtEzZ8U05B5K0rxs0VLqndayfyggqrSqw4S29BgzkXLZRWH2d1gdvbasr+ufP3WkhYR0G+Cw2+ycAE0fWU8BW7jHGwTwuRfuR9x2/DW332oZewJve+jhiYVD+4kzgDE9JRc5e8LcnCBtCo8nXn5Qyh7TA3HtfQwRJ4kWwIOMnrXbqCkYEriYGRcUE1MKW+Zu8u6Iyx3E+Eb0rjMchhdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vED0vM0rUFE1/R0ZEFiOpkkcyhoFTOCtE4HNXD2bros=;
 b=bZjmVEVKftucdIs+nIeBwVldyy8Kjd7YKfDe3+PBeLjO/XpHArkOVCG9WmMKPm9gc92LI4CG6Qh/Fy1Eqt/Izoo/7y/Y9sYQTGTfU8VpR1DOpuqTDp4zOz7HnaMOUsb/mMd0AOTqWLUzytHq4N/mIjzIO5ItFTH5s1m2Rz2kKZ4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:42 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:02 -0400
Message-Id: <20230612172805.681179-11-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: d8372e75-29d0-44df-3706-08db6b6a778f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DfMXRJ7kQuMg61bPxO4tAfvEc1SMvPYJ3E2IYcR3Xga/MtTTByJd3vigtSnDXAc9iQdWc0OeDiKZs9xA7arPoN8JehR9swJRgpn+YFHoLmx5R5/rDPLXhttjHnSomD6dhngRokmSxo8xknlJ1UtqHccfT8QRFJdxFFemhP/X0TfbhE7Gfg/whWaq0oB1xgVqq6Z3IFKKzrv/3EL5rpZq9tv3d7PWjVfi6x1H7/kZOlpKkLSL/Fo2Vn72tS+WqYlFFNMi7YFVARbMXzMaZSR7IoiBArbnpiGywRxwBhIoQimvucz1qppejN42AUHDkjR77dI9r2MrBsIpZ030ImuyZtsKmar00tcJ05qMDbpkWHCtgSuZ9IutMNgQLS4gELU7CmfWS/Etimw9FG+14ZwkY5L8WGliGV6wAymyqeOW8EQAz1pCI6Zbl/q75cgK0vBHEw1l+P+Kaii4OS4YVzYknO5PS3OM16bD+ds4WIk4JnyOKbJsLw0/KhFfKxTSzVfSgzTRi1BDV/ug0VuCl6svmsQHD2bZeqXeBWypVR2s8AJncP3ZnUKasOcjnMXgM16DqmeT75o3XXzxHWCv/ZzpdhquX5rdfMpuJMQWwRgCy0A=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?grAfxRNy44OAu1xkzmVDmQOK60SBQCAFRunllVIu6A9YEpi1otzmpa0xVvoD?=
 =?us-ascii?Q?cCX5bRmSShhInQB/Ai2X670mtxIC1cIgZ9DaX49rJtMEzhvZP+KL6jcXlng8?=
 =?us-ascii?Q?+6UI3fyjeBzgYyZ/agHJuWzjduseRPNVfMgTSOQgTSmVJBQJ1v+8Ly/eOJ8S?=
 =?us-ascii?Q?d0LdSog46d82nS5EAsjUIOAwmBNkAkF1xmQw3ycEyeSHJf1IrbNUenfin6IK?=
 =?us-ascii?Q?XMw6/ixyIOLNW0fnjl/wNMD1WHIAGlFu9vS7nJip0umw8g9IWb5QBiG/RG3r?=
 =?us-ascii?Q?UE9NhioUz67mdluURoPctuIzmkZk+ZX5GAmz2qR4q35Zk3CNtUPqCfqae3Uo?=
 =?us-ascii?Q?irbeblf06vKy5MPtoWwkO9hk+AILWNo+W15L0Z8s0CkHApf0GThozqByUvH2?=
 =?us-ascii?Q?Tx9AJpWsejg7lgObXxdj4wkYFQ+uvUZbrkpUhmMBIMxokGSJTnvcTbgDbr0T?=
 =?us-ascii?Q?nMh5ZBCc+ikStqUKEj0zWj5XcgatxD/4ANsjJ0tGkppjR7coMEUpLj7oflUh?=
 =?us-ascii?Q?gcmEYaGl4FhyzYhWnKIcL7JGETvXpvy3Aw1x6EEyI4N78FeyM3zgDBtUhkih?=
 =?us-ascii?Q?sZfhq/mCsro4kES/CeBBejyMFzxroTwuq2H2IDrSjeI1fw15SOLeueOYp0HB?=
 =?us-ascii?Q?uHTRzyxJYjzMxXpylQXY7xMGWrhHXjKWQyygmOgOmp0+ln7B9STJBBNir400?=
 =?us-ascii?Q?3hZHhBKP3g3ADTV9NtLQWbEcLBTvvoEuARC6DoFS9Injmlh2eYgY6hmC8sv/?=
 =?us-ascii?Q?3Tgsru9YD9NZ8Xbl8lsRQ1GEAjjwz4rfma5UCoI9198u3vVffcdsxQabpmHu?=
 =?us-ascii?Q?5Wf0jEZZraYicJmgQ5/p2YJvqAVEG+jg9lAsU8z8UVgj+840e/HexWXRepXF?=
 =?us-ascii?Q?98Lcs9794qsXiJQLbgdgdLQBquxJ51LEw8i/hq+W6jRgL5jUauHXTu6sYVc1?=
 =?us-ascii?Q?anzyo5Axb/PSmY5Y3GzYyXkpTaPklq2Iit1uuqnbKid4sfyLf4XGjFmICP1p?=
 =?us-ascii?Q?npg7cUawu2DlVFyPPsgvOM46mnVY7IQRQcwE/rJxyWofkd3u20Gz/WP4YKly?=
 =?us-ascii?Q?2MIJAKG/bDZ5N9gygiM6kheYWsQqDvoPytEGvdEdiMAXowxfdgoZRG96FRYB?=
 =?us-ascii?Q?Dm79H7eGgdCBNcE/oDNGzXyyxkUiU7oySezUGRqA+QPXguC1hfZaNpdPxf15?=
 =?us-ascii?Q?CFXgZrC9tjxP54vEMTYWOJf5XPdNXyYnIHNqH5Xv7wOP41fFiKwzmNeqBLeB?=
 =?us-ascii?Q?7Hz5i5MXIpP4JL2GHyvCkyt3aN56Gx12Ku11XoqJ20wce/pdOhdLZ2NGVRZT?=
 =?us-ascii?Q?Lwh6vMglZO44oayTKCnknKuymOidZ067P4Uegk+yDDbtFla7f/vno0fsJ7mi?=
 =?us-ascii?Q?JotSZix+uRfebfl3pfxXc0aFh9eIGtKiH4iKiU+eM2nRqkv9VmunEYZgBKiO?=
 =?us-ascii?Q?ikTGBhCK9AM2Q2Rh0mAeIKvWBKHUKl69oqxVYeCQHFjGvXaJbzcA0goT/GIk?=
 =?us-ascii?Q?kkKkBPQtN4aEOS44EDhFc/i2GwDJGHaKDrI7f3sZxbZSeY2NcSCR7snc0oo/?=
 =?us-ascii?Q?Ec5fHGc84X+vD9mMhsMY3hSKLIAqZUrwKyAdTRlziPU2ZZT9ILTIa8GaK/45?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?JTARE6FOFT4nrKCeHEluUxAwunzDfwTlxoa21ppHRwfNdP5ZDbRlcHOqmuyd?=
 =?us-ascii?Q?tnM4GMFC9D0i4wGUHc7AVn+83kou6hXVutklF2RVp2mrbFm+w3cu9YgE7R3R?=
 =?us-ascii?Q?NfP5dD/xjyokFJ1P6scGA47tU3VMuk4SZuOdKGyYm1vNIUbPxDNFQRjV+cRC?=
 =?us-ascii?Q?MnXDHZr+mdHqLUtgmB55LwDq7B2TuorYlHcEfP5DUJFqpEhfUa/22M5ma5xS?=
 =?us-ascii?Q?a0jZ7xSgGZR1Eb8Nq0jRclRSmveaW7h1M7FKMC5eVvIEqvoEf1kp4uBes72l?=
 =?us-ascii?Q?qpkFqjmQNJwY/c22QCVkMTrFXq6xCVxIsYLSlm0GE2zxLWhYy9qpiQnCPLha?=
 =?us-ascii?Q?RANLf5gKnKVBq15DUvbjvfJ0y6iFmRehnCN6eQqJiaHlBke6th6r+D3qlgjf?=
 =?us-ascii?Q?JqWSYEAN6SneKFcMMMpVTQhzMWgdwc8yrKwRY458VJ4Bs8aAHK0tdXmAPbY+?=
 =?us-ascii?Q?E2SD+e6n5SeQ/saAtrh2f8VRZx7xZe0j6jpcUZcXEGXBSFw0ZWf8fOjw4yUD?=
 =?us-ascii?Q?teLXNYw750lIjZX0Pdmrw9IaUiM/la2YhfrjY9g5p+JOhVFrawWa7vZACTuT?=
 =?us-ascii?Q?W3iL2UuLIIMCbHbLUIk0V++6iSFWER5eX3L+w06I6OcI+lxnOnSxzafLVMtm?=
 =?us-ascii?Q?gpnQf76XK8ONwaOIPhFxyH9L7fMrmijZwK+fACfhZgxxmOwXWcOzCsGkOLNX?=
 =?us-ascii?Q?U/7Gok/eKdlFjh1ItKfvVJa7ojhYSqSdaK/t4JrpMCctyKiAdBAAtc4/naEZ?=
 =?us-ascii?Q?50ua1kB4pEgyHcVspaj3IE4l63xU9J7GzxNj0Yg4lJOCxr6iztzwx/33jtys?=
 =?us-ascii?Q?rTziPaAhtX2b1PuVBm9ewofuREL3w7pinvjLZqiahUgA/MR/b9r/yBojU2ra?=
 =?us-ascii?Q?q4iiDptRH9OB9WYxeYpwERZ9Bc9ASpUj3nTWnYyaIEFB7euwRr66WkIj8zao?=
 =?us-ascii?Q?KOiU9rXB5UXa9Yb68erqcQSLPBSKL3+tIqI3BKFx327XR8EesXcQKpcmy04i?=
 =?us-ascii?Q?S4rabFUB4k2RMkrhBUwwTTzi4mQWYxUQQJYP5dn44Izx0JZFjrl3Jn+f6OPB?=
 =?us-ascii?Q?4nDmmmH6YRMjAgFE48Fxa6lnBX7snjZyHkmf/eRYQQycJKXXs6KI/ifdmLqa?=
 =?us-ascii?Q?LrvruqZdBAgKy9EPON/PWIKhdOyWCXO7qvTNXaRgYijj+7c+1s3v/o4F5WA3?=
 =?us-ascii?Q?mvE8t+1NjP6h6RnKkjXOaguq7NhFjx9aczQrOITZsYFnyGSentKbJSykL4Sq?=
 =?us-ascii?Q?qRsfvzPalKQAgbYkpQcBvayBNqMjkj5Cmvfbws0m12sBAifoFBBJ/qjnUL3R?=
 =?us-ascii?Q?xj0D4F/M6ke8htut66t14m6/aB8hVBV51fl79ozWdZevUBtQ5dQseEMYpL+x?=
 =?us-ascii?Q?BKZaMCFrn3ryyXmxt20TUHlABaOkMhOf3w97LVgGEq3vCtaUZhEteoTaZAX1?=
 =?us-ascii?Q?ZQYHd4n/oUo3lhJOhTcWlZI/P7wygTgLEulGC2To5ZIdltfa4h5vvs6qy/i3?=
 =?us-ascii?Q?Rrbm9U+EOilz5jMv6718J+I9jclj7xFGPt0lWhJ24KDPrtG8f6VKmRUxwO+O?=
 =?us-ascii?Q?2GdY4MQh9mfmsp4SW+z551rn67ZGBYJ5+hF91EX2BaPJJxH0IIbBNhRiTO5C?=
 =?us-ascii?Q?Atkf+vpmLdjEp+s7+k25aNQ5tSN6R7yMp7iyxME5iN7jJ+CoTOqBYtVt5FDW?=
 =?us-ascii?Q?NsoIemgaRBluIkRZAHpscLw0cWv3zcSWjNRiOHBsF0tIqgy175SpJxKXEm5h?=
 =?us-ascii?Q?lAaGEZBu3HS6no33GZ6zzXvHRIdvClEV3AiRDy8EiD2dmPQwxBAeo1V/sKdD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	ZyCIQkpkQYX372tPbObH7Mr272xKGWceRKtN0+NAoxJ+0Ml8JOgxWZZDItadBQiGOsE6ipL/FlQqcY9I6HvG8WcRvzXW6vBIEn7YinlePxu5BJ6wXrtkuucmI1bOo30ujTnKAlNch3UaRZN8Ch5XJxwWfG5bLVkH1fHifMBiJXnYkUIpgOIbtLBkgxO5WCrYLQw1wzfsIYByAWoeI5cLU1dNveUAiSnmIGkOVG8FQV4Dyy/qO2dP4JMWQcz84Qa+3zTFmN8ls05/H0CKYkGTeeB8+k2x0dAMXO/a5adOJr3lgnN30Fa38flbd4wrPJNCFgKn+R6zDqBGxo8A8TIshCCQRtLHDDDeD54YUmNOadwa/YiHo7orciDQrNgLa957z42r0GJXmbzw2/Y1e7S6om5QWyewvSwPvxhmvKKj4kaPqJucU2h9hNMMPKaYXhvQbjrKcXQnOP5O/w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8372e75-29d0-44df-3706-08db6b6a778f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:42.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KK0gfcLYeaHGeJVtDBeMjT/XKVdvGxcLRRwIpFhx29P6KLng5fXfh5EpgIgvIAYeIy0nrFHSrqQbxGwaMSLWsInEyccvFrTcT9mxc+Mmjh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-GUID: EIOS7zdBNjv-6dP9PE9hlbW-KKF1KdCZ
X-Proofpoint-ORIG-GUID: EIOS7zdBNjv-6dP9PE9hlbW-KKF1KdCZ
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda..36f2fe0cc8a5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -588,41 +588,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 	default "y" if PPC_POWERNV
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 
-config KEXEC
-	bool "kexec system call"
-	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_ELF
-	depends on PPC64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is a new version of the kexec system call. This call is
-	  file based and takes in file descriptors as system call arguments
-	  for kernel and initramfs as opposed to a list of segments as is the
-	  case for the older kexec call.
+config ARCH_HAS_KEXEC
+	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
+
+config ARCH_HAS_KEXEC_FILE
+	def_bool PPC64 && CRYPTO && CRYPTO_SHA256
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+	select HAVE_IMA_KEXEC if IMA
+
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
 	depends on PPC64 && CPU_BIG_ENDIAN
@@ -682,14 +662,13 @@ config RELOCATABLE_TEST
 	  loaded at, which tends to be non-zero and therefore test the
 	  relocation code.
 
-config CRASH_DUMP
-	bool "Build a dump capture kernel"
-	depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+config ARCH_HAS_CRASH_DUMP
+	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE if PPC64 || 44x || PPC_85xx
-	help
-	  Build a kernel suitable for use as a dump capture kernel.
-	  The same kernel binary can be used as production kernel and dump
-	  capture kernel.
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-- 
2.31.1

