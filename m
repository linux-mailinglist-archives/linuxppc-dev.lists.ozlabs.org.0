Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F93072D029
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:07:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=pIg5xnTj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y+/F6mv3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2ly6nRvz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:07:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=pIg5xnTj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=y+/F6mv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0qT4nVJz30DD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:40:20 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNr7h031990;
	Mon, 12 Jun 2023 17:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=6wmzWSL2YBGepZ1aB0tX53kN5FDgi2nMW+NTRmgqeYw=;
 b=pIg5xnTj/zs3yFVnD3EGUKzSDD1uLeuZjwcn4Ug5KFtHf4JzKMtHWHVoEkpX5RBmfpse
 oeRjnZoLX8AynLo++CaC5tE5jZEjW/wj3d23W+sZIh7sGDraUWoRuEAYP3/2XdOASvjS
 wkT0JF0sgQBtQXybH81IscH+QSJj9Aic5suLTon3KAjEzu11tGfesNOR3FV8pC1vtugs
 wnc4xwCj+DkXKSs0THiYC1KY7fc65ozjIXRgYpEuhzNt0njX6zljo3K6/s81Rd0qqeVx
 BRinlMQb1ClYUtkKX0sTxsVplonJfVMsfEuoC4As/zP+R6R5iTk8lnUbKHAgw0WN1aVs lw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h7d3fdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:46 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdk016254;
	Mon, 12 Jun 2023 17:28:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeH8H6c07VUQtYsHnup+93DaRP6SiWDOZFhOlV3q3AkTXaxswrFIl6wQ6S+L6+9ryHcd22OvPcWfQAVjJwibAWqCZqAnIcepI0IKICUJp4oJaZDGqdFk01pzALKuIsgxy5xJqpm/ARTb9JM3SIBRBCZgpUyXry2XeW6fMWqt9Iu30cSYH/moaHHlZYCiryk1juegK9u93Rn6ZTOq8nxoCZ8YglgC7zQKuiwRVbEtXkSZ+6aSRsT8yj8iQqpxhU944ZPyNNCgLEN5P6C9i079rYOUVkZnLga1lKTbp4pKPyqsfTfvhvRcXyBzrlxwUlDuewr4U4KQ+11r8o5dwEhsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wmzWSL2YBGepZ1aB0tX53kN5FDgi2nMW+NTRmgqeYw=;
 b=DoG/nkt9DnHT8ftSeb5R8BzuwuQPde2LT1jP6QNzZxKUBK479bWWHFv0ZxxwRj0JBjZmum+03q/jJYYlcb+edE564213UJQ+Ygut9IjvWAhN87h6KT4l+PjpZUiDo6Sf954ASdx5X4CTK+OwLfBwT5TwcdB3lBR/U/B9xJqfMj3Tz/2chdYkX6n6XP8/pzv9QCpW+CRwL0RjtbSSKwbwfUqLFky/EL0m2KezvrRIRBwqUmPiBodT6UC6fieOMg3uJf3RczNsIo9Nvu1zWoDQfvMX5ABrSkeQ9TTs7OGwSXCcqUYQdE2tqRISBFULor1xVn8IFZjlqtgKywMO2bIs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wmzWSL2YBGepZ1aB0tX53kN5FDgi2nMW+NTRmgqeYw=;
 b=y+/F6mv32cm4uq01SYNSB92PfhtkY3Zq6QTubIZ/ySYzFd+Mfe8nc503uooBI3ycEzQHtoTv6hImv8TjJumMIYirVRrcW/gNEQsZXgZ3Lx86bpp1O7H1tchnbYS3ewr/PUANulpJFBdMJlSuw23KEkaV0oFMrBxfJa6vPuDYy74=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:31 +0000
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
Subject: [PATCH v1 06/21] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:58 -0400
Message-Id: <20230612172805.681179-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ed774f-9d01-4307-a847-08db6b6a713c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bqAexMbSZWVHvzOUMexaeZTL+T+bGjpdfZ8zjH1v2LeZ97Jw2JSDTdkRcd62CVIVSy0RG6k9+u2w3/Y4AqbhOLq5w3euWhaEBvhygrwZZZP2KfPFWZL2losDLdHrmIQa7+qXi1rZ+69EnUsPxURv2wcQBja3G3kd2WcYtAf6/YedBIAG5sV8WDP2QZwVYhpxqekLiw6GE/tKRNaYUIZt/ApJ9YWCr2ksmH/wp6aYAfm+rVkUULaZgO8EgFFODtu0Z845XRQJagFT7CqKdr14I17ZYK3B8FlKquzEphyVDdnRXgiyi21eoODdDiXxqycn7LLiSpxv09DVPHqqoq1QrStZNMjb4DrTZDXNMxR2ilXjk2zGJjp8bVII89YMKkrbEkPqdwCg5SIWlOk9xeK+MbYuVSvmvB7q5vw45ZMLPd1QxnWw9qyoWO9Ec3uHTZgpAql63nJR5LFSnz5h/CJaZkAuY6bfZAWLvkWA+LE+Emvlk5IfvmCZ8GgD3TLl75KeTSvveg5V3+Jl1GvvNggvRlg8icZOtJh1xJepU+fhXOiUSzBurzjwPR+OgC463yHkHGb+PfFltB3c3dCem89ySzd4n498p6N18xges9kHMgQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?d6UlT7OvGVIZgxcq4dKA4QMO6O8NAD7LJEp5tGJgv1UcPLrCnKEyUHL33cBz?=
 =?us-ascii?Q?DvasG/BZeYldy+DL+yXn3kI9DKN7I9VwlrG3hebMhKwtO2tay1Gfqer50Yau?=
 =?us-ascii?Q?F/ab7aKWnrq3XHWQeVoHRTEcXXc+UdYtP9eeMocx1w+RIhFBFf0sRQWnQZHS?=
 =?us-ascii?Q?4iuvuAkHc3iqfcjwbRUDNNGoMNfzbyTU54nzh/Z4gF3A69mcHlHsdYuLKM8u?=
 =?us-ascii?Q?uGt7U28zYkQ+jvWDa/x8oMqWYNFNl+tYNt/ngHyCutMPN3/M7Js50QhK3EU8?=
 =?us-ascii?Q?L64XeQzYn0wGQKI1IJTw9fW2fzkx5rmaGBktjylhZKjda74ruD8vC66dWw/g?=
 =?us-ascii?Q?h6hP5uDuMY4WC3fQn8t6IlGkrS50JcxOEKunWEQ38cZ9LWYL9IrMP66qvR/N?=
 =?us-ascii?Q?9k9x59Eu5LM6t+nezJE7QiZkRJrUtyYT29MTWw2BFN2JX0dnYOhoTjX118gm?=
 =?us-ascii?Q?dUHlPSgkUdtAlNBIDhpo9g56z0HfSZW6/pYOl24EVXgsKnPA6lZbD+dxm23R?=
 =?us-ascii?Q?55p15AYCZnJ9Nhr92lIzNdDeEhsBkBifndK/iuS+Kmz9wfJ/EpqJtn/2zJKm?=
 =?us-ascii?Q?oDShkRAU8BbgpabhCNrcBVOL2BM1EhBMUUlqE5faLxbDmuLyoC/UumQ3mFVt?=
 =?us-ascii?Q?nW3YWsnshuz4LtXqm/afrI6MqRl/lFAwgzmg6RZGgmeWQltpe0o5D0RjW93x?=
 =?us-ascii?Q?s8TfaG2QVJ1hpQT7wbsrlQT5yGyEPNhdYBAHZ4dhlFCkv9d75/f5hD3R8yyp?=
 =?us-ascii?Q?pA2MRLsiJEKETBkYr1ysP/Q2PPkvjEA0cZqSNZM6groebvvvtZe2iyvLs3UD?=
 =?us-ascii?Q?vZY/6n+rFXADM9So+V1t8udTUdHmqIJdUIORfUdU2nAPQg4qDuCWZp24raGw?=
 =?us-ascii?Q?tclJjlbKZ+e+HQqb74fGb+My8+c06WVqbRMKgE4ZRuGqfEC5ga9ZwQbq8XV4?=
 =?us-ascii?Q?qo3llpJuBOSIHxAUiXa9rJqQKHnYudHpqQNVnj+/Hk6j0ebMCjsESk5BN+Pe?=
 =?us-ascii?Q?u7F+POHvh0KfbW5YTbJMYINWEsR3nMLEvtHJdzM2CLyX7va6msFiuBfCwvkW?=
 =?us-ascii?Q?jQn11CMYMPixKRMf0E5jNjPhLwAU8GmsayeF+ZH5voFn/ot6isX1C/1OYvbj?=
 =?us-ascii?Q?L+28uK1cG3evnj7KYEeqdilngF8fIB52HntO/GHDMeYpoNJoxaxsgZFHk2Hq?=
 =?us-ascii?Q?6CHZLY2XYx01y3q7yYnmAFiSy515aAs/FJhoP5SlKi7pc54VzizX1CgAQ13M?=
 =?us-ascii?Q?+gjznGVKAxRUjC0lifScfj3gUPLFqNF+rxRs329T2KJm+2jECOWqBAuge9L/?=
 =?us-ascii?Q?taihex8uZYCAmuEe0CfUsKATQ1dx/V9GiC0O588oIzP7Ascei07kKBCx5gnV?=
 =?us-ascii?Q?PJmOFI3Awm+kq8e0GcabhDp/SM2Ta+zggh6/VFCwMmXn/xEQYr3hU14fqK0N?=
 =?us-ascii?Q?aKltX5HfwKRWYFhL4S+CDrt59ftR4Z8eo46aDGdHvh+QPKflpgB3SETDYmUW?=
 =?us-ascii?Q?lI+esGiGY7SD3sivkpKFCrTGLsgkEvecJbhakoWucIcGheUnhHXGeRxg9zm+?=
 =?us-ascii?Q?FRUTSCue/z6xFb7a2Am675TUdSWXY0nVwWBYsD70tKuTtpQtd3rnCuWx7x+l?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?zJ4HUWAu/HwpHqsL1yNwIysZrPCJotymBLRk6Gj36tCmfhRb7WxR/0d0NLOQ?=
 =?us-ascii?Q?05NP0Bj6DUl09i+DLQ9XeulzhC0TY+VXFTDYwUIAn/Z6MGznnF3jk4Muvidr?=
 =?us-ascii?Q?I2wXBwkMCL2yjPSSBf65w/fT5zbQIOHcgQJt/ZUO2RiRuyEmD1h2IZMOgb3D?=
 =?us-ascii?Q?x1erZ6D+30THpU397VlZNizD+yxToCMBVvGlm2HfZk0pU9Y68sVALrsJ7+zE?=
 =?us-ascii?Q?ZB0tT7lTjHIlQyn2TQCGgJJ2FC2mbyCk+n2PsNSZPqFgfVaZUBlqeuusTXPU?=
 =?us-ascii?Q?WiJQdHf+N0ceN7vMkntdNr9Qi1WYV6AqIoYJtEATY+2vYa8v6jzaAQ6h1yM4?=
 =?us-ascii?Q?xP8Pr2fz6VfgucDuu8yKI8QnCXbmJnv9pNZ5MRj+RO8vVaJXXylDtg9aJsmR?=
 =?us-ascii?Q?Oo4rD5S0Rc6mwKW22jbUNaHzzA2vliGj2q/0jvDoSWephO/jyehFcf2GGeGF?=
 =?us-ascii?Q?MgD4f447oiSS9i9UPrf6v9IxtGqD0FfxXqJbQO72ksmDisG+gyH3g+SaXOwL?=
 =?us-ascii?Q?ygReG/hwwaCG6CHUA3Jfhppi9kaE7GkQqWbmF8AgUkdMk/ot2OVdJnmr0jrQ?=
 =?us-ascii?Q?QQdkwMs/t9M60TNpOVLeFbCYE4hTIZv34Ihz9ADJLkigR5V++yl6/496Mue0?=
 =?us-ascii?Q?VNJUwLnGzn23vFLBCuEFndIS/gag/NPt425Vla+NGGPcZzaz973bF3jTEAtO?=
 =?us-ascii?Q?XVRkJpcluNXWpQIAu5KQWeVGeyqvqLxjnYuDjlUDpY/To+rvWp1zsBtCYJnS?=
 =?us-ascii?Q?sRT6dxrenPIi+oPYPd9YyRR0h/0z7tfbJleb1hCuKbdi+XAYudY+rL8PEG1R?=
 =?us-ascii?Q?erm4brWLN21c+F0/Fu9GUwtfPuaKGTqP7pAnh4a92ZdLstSkcG+xi/sr0P0H?=
 =?us-ascii?Q?j8C4xVhcZ1isYHG44yzpMc2T8Kmsa29KyLD/V1Itt/9hrwVuylBRvf6q5mRK?=
 =?us-ascii?Q?2KbVYyTES6fkpbWiTr8dXzqTZxKKVEmXqYb73MMczfKIZx/obAHJaYxsQjYB?=
 =?us-ascii?Q?6PYsftxnGHcn53MLv3GZ/Bk3dk5SiBrZ/lJd/s8ESYf4FZTPAZE8KkkTjcTD?=
 =?us-ascii?Q?5IpVEiMz/7L49Oxm97ZN0P5V2BxMdiNFu17WzJPTahva499QX14NZ5nh7Uzw?=
 =?us-ascii?Q?S2ffxwDDZAhuRX1m9ZqPV4eKMEaboryikFUcPs12vXvgbvnPAQH4p632X3V2?=
 =?us-ascii?Q?T4oCbrPezAqThDjFZY3qxU4kCTjgkGkoNDCWZqMuMo0Ujev/znGw1w5WgzIO?=
 =?us-ascii?Q?Im1FePGi1E7URFG9C3zjRwfjwLqFsM8utQrdBJ6oNiCE00I/uGnIKJILtnLJ?=
 =?us-ascii?Q?z2FDGXYnHU2fF0JyT9TrG1O0gHGoiSoHLbksbRgOHbWUrp7b6j4KCBAFx7k1?=
 =?us-ascii?Q?h7qYEdxuBwrQghQsaCx+Mfwq4tX1ATg/ozG05jNL/M3InMPjBFBtqvaQivVv?=
 =?us-ascii?Q?nZa+o4xw6W3srnVZd06BHdFytmlldkpk39xpjc2cT/5PQ6E0QWw3mB2GlOMv?=
 =?us-ascii?Q?7Qz5jlk7La4bUGLvdrjbzBJgpCul77Ugnly0Gai4mqRX3qSRl6oNgzqCmsgT?=
 =?us-ascii?Q?CB9cEGYIyEYx4nlizSZCnY9a0vv+VVQRbZvmFeSEiTMtOjpv1+8f0TTGuoyZ?=
 =?us-ascii?Q?dyKaHcJDx3rm/hgyQTaYkAL8OcTOxlTuacqadEu0ErqkCNyg1Qh1R6NG2vNT?=
 =?us-ascii?Q?q80ledQYqzooifxgyZM8Q/PJeYF20lTAjBd7gJtOtdBo73/d/EYW7M+lvRKU?=
 =?us-ascii?Q?+5xlE5vyKr9PPBEkCK7Lcf5CgX7+xk3XaPFhtj3zY6uEwl5FO3ak/zWe51zF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	INrbQ2P+npifg2GznY0Q1PiyPo4Y3LaxY95gDq5b4kqSrghXt76uVwZlV+vjTM7ROXXIJuwKJICbi9yrzWJppdOW4xJUlPgoqSl89kf1M5OUoMB2sML82eDXTXODryb+0IZDq8aXwOiJh+oehB+Z9C9rVWiOXpdrQnvYjl4mO3llPL9YgvCiR7wNl3YJBzzDFkA1XuOrjbFlVFmRKNnw6psnFVuUN7tRWAn21nYr4MRRHhZvDb3DB9GV+tyKd+2HefmKC81Q3FtoqlcgiXEtvXL9GIsqRiiG70pt46pbSAESlqbLjp7jrHVHZijZGI8DYOXZ4VxugCAhlEUMVvMBAln0sp45MGfVrjGhHA3tR6mUCtScc3niRNe2NlHVmhbLc73qIoDqSmA2zBJDCOlU9EsimOKgYHJGHVbeTNszoB7WoEOMjCpq0+qnZIVEiGRcPhdE6Ii7m30H3Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ed774f-9d01-4307-a847-08db6b6a713c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:31.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnWL7uXocX7xZBvo0rr5x95/GnpyVYIxZ6k+UFiYFySzh2a07M97tCYo75hGN7hufE6uNuyrvQNsI+nSDAyEh2W7S/hIaqahHT7kyXKoeJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: vug2UuI7eBp8UwB6sQJVj8MWnqE1LP-l
X-Proofpoint-GUID: vug2UuI7eBp8UwB6sQJVj8MWnqE1LP-l
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
---
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..e836d3310060 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -481,28 +481,16 @@ config ARCH_STRICT_ALIGN
 	  to run kernel only on systems with h/w unaligned access support in
 	  order to optimise for performance.
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
+config ARCH_HAS_KEXEC
+	def_bool y
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-- 
2.31.1

