Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D67490CA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:05:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eqXyZWak;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gII42VN5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDHn0Zhfz3c03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:05:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eqXyZWak;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gII42VN5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zQ3cZFz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:48 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDkHL027778;
	Wed, 5 Jul 2023 14:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=eqXyZWakZg8IgVffj7Rth4L5RZjXLxyO99J/SHZQOv2iZw934RB0wyxHoRK1MY83JsPM
 gUyQTWIjI0Gi9sDB5VwN6FauKisBvNl9k5eR757arXM9kxXeixphaX5eku9Lvc7boozp
 qyTOr0pN6t5IavXxeeKUxfPNo5sgfFSkR3ywYe2hqlrmsBhqfZRBF9fo3DjBs26oTuYR
 tEsoVtvFFxDyG1zE05p2DosGLbxGuUojw1US/GdBJoOkTtNO2w/ox3r3+8bTjSLnZ1jd
 mxbkw+Do18KOjRI4JelxiIluoRvUmoDWeC2q0qp2PPCme55QYGIdw1c0JObpQtlYJ5tM uw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjbrtehs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:29 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsjW013468;
	Wed, 5 Jul 2023 14:20:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5pmh4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrbyDTXvQNSWeFKZyMYCfDnrdmTpU+fmElD953/IIWla9VfOjjHfcwXqAj10IfqL2WlZZM1omL6bzpWg/u9hba6gfMctoNLa/z7OTytCEJjXkoPXPEefSmvJGHVx69LesH51C65nO+M1yArnQerP1okTTPBonhFmV51J45ec03f4Ea1sX4n3xPn+1IIe4Oxw4/Esi8yuJM9v8QVtvqDyqB/xqhjJxbabHP36D5h1TeG2tWndwzHtRSlh9Cx/u+0+Zz3TcksFHWf2LhF+V5CK+ekF+evQzvYUiihhOzhKAkt9pkdErBGw2mtpQC7a2QKzcerCKysWdx6Pj9/SEfMjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=DUSSUjpktTrwLr2OSH9Ixu9FSHlJDBdp8PBLCfedcCpZ9VcnCxJA2CRWV8n+Ux8II03TiDekIe3WZ5RaUkWFInHPEnZWWnHIckNA5NT0MYiRckCOkSYU5oBzPpHKkFO4ma7FsYZdXg3x4pJcqKMgtQgJJgCc5rka8gZVuBLxk9lxRvJwCtxR6eO5Ih1nTydeHI869QbYq8gCKek0ZQSlSZa7jCzEKOZmyDU5dnnrPXTCR9Rwgp510zh4uoMInNqJoZq1v/WYFzEWlGlI6jagXxXY2m8/RHLBBA6XTzolUCwRnmk1Gu8frfDgS+BY3PYhD+//+rSI+QbLcXdl+FkCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=gII42VN5KiqkkNKEbAiHvq4tM/kHHfeYtlHAjSekdffQa3sF66QZ03GiIKnOW/aVj9cbOs8sS2jS2RUk+yHtAXr0h5CAiRefa2HM5pbxUl/BxXUT8zFcMMU2V1fhiNmtnqs5vWSbmm99lirI9lZas9UexM4Kpiu0yK2kkwnPCPg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:24 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:24 +0000
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
Subject: [PATCH v4 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:54 -0400
Message-Id: <20230705142004.3605799-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: f38af48c-2f5e-4f4d-5104-08db7d62f93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xrhDXfObYLIg7IrsxaEr5FoVxU/zH5z1HXfR7bJCkWYJrfZNz2HtfkHaNK2foD1aBVUF7fgh7/1zn7Dso9v2JLPn0ak6EVQAypLvbZSpEFH7NdyzOsqINpvz3JI+l4yCn4S0mpLeUmba8LdDhJvvhyjAB/SXVe29eVXgZzJH9qDbvVVcUeEvNvUCMo5DjmGnPXoE9VtRzArnxvTKQ5LTvC9O0YR2eyhiszb51xYXcqr9L6lmO0wo0l9W+qW4JziDGg/wgQaoJUUqAuXh8jCNs93z81UhM9BI0nzw3dqAY7FBVn1j7ozOXhheMqPe70HLGZ5JdZJPUucoE896FkW2W7OGGKCJC+npqMHkGiqiTw9v919t8Xh/2zO0DTpx2LAqEA8thHM3LO3TYyH1jFJAetgQi9Qgxp3XtGTygt0Y2tIoX1hcMBPl1gxCgfQCpBR3Q8CCLKv9jEgaUXoXaWBR9wbnJgVCnh+dvldfAlnPDOVR8GlQZfYIcEtrHKTHOZlwOiCsPfbraB6Tc/jmPmXue6KNU/3JN1BOVhkx+8KkyNqGtH2LVISfc1hzuGBS4oBlvEAJRcmb40eVuuu4nP6/WSGjNt3g9/eMQNcaGafBPCc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8+GDL8kjRBwC8lnya36SrJcKf4bjFMSJyUzcwNj+CKZy5GzmQmE2WjcXHAYO?=
 =?us-ascii?Q?RrJy6N76fF8QJgukMvLQYGntIwSflP/TqQTtiNG2OQq3CF7dUY9pAn3eHHSc?=
 =?us-ascii?Q?p/OkHTetB4hmtbVTp1xj8hvhPlqXZqCIltzKsUYltWeK4mJxCYdGzWEII+h1?=
 =?us-ascii?Q?2+5Zck0cAd4GUGH5BJSmKUsCZPKOm2OVC5x/WfjTH6wifZqrkNP/Eq47TVi3?=
 =?us-ascii?Q?ycjxqIZIt4sIX+t13kD2+lzw5/cTJQDkhlq1bPdKhMBdM74g664qdck+2e/e?=
 =?us-ascii?Q?7LIDU0BLD96JF7L4qQFND/1firsmoTkTf7rF81zJcVSNmZzEHU10OKFqxI9d?=
 =?us-ascii?Q?7M5wyesX9bfDg/nkC/RM+sPd1spKjXihLS0gFUNCIob+cAowixscubOgX7Co?=
 =?us-ascii?Q?tTJx+zb5/JEaXoPftip+bxNW6ekyQUhvuzcg0h35ngw2D21kLTqwhbPA65Bh?=
 =?us-ascii?Q?/mGxjzTq0o/GW2E2lIOX3dqoLxeHJG0Gxhf8lZDeML5wlF70LazJPXlqwbWA?=
 =?us-ascii?Q?XHKH6gWIY79phiN2YK1YDpOpuPm59wZrrRwz6ba7VI/hwwF3o0oiIa/3uwXH?=
 =?us-ascii?Q?28nA5JCvu2BdtB/j77Q7Cc2XzmSbXln2XDM+5u9SpiBhth4ktEoYtTXVunMT?=
 =?us-ascii?Q?5Ba78GbuQFoASKQSabHn9seUJBwxhow2XQXshcq5LX/AZrtJyLx/7E4uIHWN?=
 =?us-ascii?Q?wjp4RJKFrsslZdp7NCGHxDex+3nBsE++P8D9MCJhe+70Y2Sl2YECl2M3jioC?=
 =?us-ascii?Q?hp+QWGVAgXkeJ5XIS+VLSHHwOsyx4BUpx0Jc3OHO+3ubinwXWYcSZx7AbSB/?=
 =?us-ascii?Q?bA0MpG8vCXOBx+DE51nbU3evpATU7yiccUq/Y9OswO0Ls8EfW9XS0ZIjQk0M?=
 =?us-ascii?Q?M6y3HuwAWK890bHwpHVL2/vaoT0aZlu0r7DrwQ+SwVLlSrYD7yjgNVbXddAX?=
 =?us-ascii?Q?e4zDXG9u+YG9pD7+xF+ImJbBjyARKZrTWjw1TqRAe+/AxCjh5XhWGcOJf+Pr?=
 =?us-ascii?Q?E97qFmf3uisS03oASA6I/S67fR8fFGQGa26ruWWL1Uaz0+Awilgpfsy+GBpJ?=
 =?us-ascii?Q?ICzBVM0FAngifybfuErhNzEzY8aTmghGyj1mh1EC/uq9vu+TMlder0Cy6YfD?=
 =?us-ascii?Q?VIMx7t7XUxbduQvKFNbRSZfQO87RAxjAQHx/dHkqNYFaslBfxGXAVBkGjyir?=
 =?us-ascii?Q?TfR/VncVKB/Ui5fMQ7Gt+zys0h+ewSZb4bVeMTkBvhyUwL8wxEjPK3YpWuQC?=
 =?us-ascii?Q?oJCa8fa4s+NB2iBY9S4lCe23YdbgxMeHy7uekIdcikufWWoVPBwm0ZXTYmUV?=
 =?us-ascii?Q?MZVQ/aHJhOD+OGlFkThsTEzL5HZ0am5ld8oAQd6crKNU+QFNcQLDGBex7p/K?=
 =?us-ascii?Q?OMtMmMRYjd/1aizdcydVLBcErgCS32RphldLyI156qHrV4USjPX6y0IBgV8z?=
 =?us-ascii?Q?3SG8jsbuG/IguRCJS6hQXFDniRX1gw9Ugczdw9J97RzcbCGAofFiYw+NniJD?=
 =?us-ascii?Q?dMHKKk0k38oiLyf/D/ghnNgCuwGX0VQWqEmqmiTmnzjrWnY6Czzl62ncjLCm?=
 =?us-ascii?Q?k24JUYOisnBAz+56KAR7kuf1FewD5lxRncuvwRm6SaTB4ouVYT68Cq5n0cOi?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?E5sJDTPSJD5PX5M8h7F+MK4umgTqEQDlTR7GI0f/cscSXA3QRz2H9u0qepLd?=
 =?us-ascii?Q?ENyf9I0tvWvleW3z1BvFrt9kpmx1lljgdlNEOfAn0QSYazWD4mXscd6s8j/O?=
 =?us-ascii?Q?XMZagUjhiDooiffkwRGZjVlbyDdc96wm86qDWcN/SPHdNouQXRMEAA2h/mym?=
 =?us-ascii?Q?vJW8T+2eeFbi2396Krd416tDWyV1N/yDiW62P1fAarLc+U6uIlHtJkijRt9q?=
 =?us-ascii?Q?S7SDeIqIsUJ+tcMA/oBbMhYgo2M1QntZITZk3qOd44ujjFBp6oNU5pywuWz8?=
 =?us-ascii?Q?bZm24g7x9qptjwjDGh5wn3HSGcH0l8rfEp4kQGf1dmIQ6FIU/alKr/qqUkhW?=
 =?us-ascii?Q?p2eURvc4lO4ybfOzYHIk8GUakhX0ANNE5VKhBwU1RmFb4yT2G2C9Pm3WAgPC?=
 =?us-ascii?Q?4+8jWX8SFP5VXAuTPs5w4RCpqYCauTDSWuMhb5u7/U9Nhi5j5o2iIwgWHMH3?=
 =?us-ascii?Q?gAHcQRPDpXQ5CdbZhbsvnTw3islOUxSViHHL0farwEJwWZBz8PL99E8GnLuS?=
 =?us-ascii?Q?nRIvUreTpFp8dyejnbGB4t36NoYHwpI9AizCkFEWuW24pepyiGmEKpcqTaW1?=
 =?us-ascii?Q?+z+JEpLqutehROC1254EHeaWV4HzRDIXdh//0QrVAnRbqnLT9IWVubvvV3Ls?=
 =?us-ascii?Q?P7BzYmERpCazBzH174RRr5ejHuIlAIkj+K/2afDzW4OWDN0WlCojhs0bmDHh?=
 =?us-ascii?Q?KpNhZJj2Yisy5rMI94FBFoyZHdT+t17MrgROApYz1MtZGp+/8jEriqDrrO/1?=
 =?us-ascii?Q?H2US3czx+Z/4Spestsu4K1SdoS8P9blFIbKNES4Ox3bMjpa98f2XUkiQeMR9?=
 =?us-ascii?Q?ucm7OS21yZqZ2BHy/Slugv5Dgt3OuWTNc5COXnHf5sQWfOh1yOJE6nEG2c4n?=
 =?us-ascii?Q?rm/D1BZqCFFbFQnWmycXEei49yldNX+Ryr8WCR/6hWeXfCHFF3Ckus1P8Klr?=
 =?us-ascii?Q?5uQ1oiOW9mhREMZ7+aGbEjOTKwDLtYsEkOVe4ZPRNEaDDxRP72s7Vnj5Nrsh?=
 =?us-ascii?Q?B2Xc4NmP6bhu7u+gs+8CQECKCuXikOLT8zufwpebi54nGfCNOkSJtaH70idD?=
 =?us-ascii?Q?YQy8va9GxQK5m7Tzc0dpSoNYgw/GfV/vEdUDddPxiQuGk9g1ABl2EYOrjEk+?=
 =?us-ascii?Q?sTbsvRqFvqMbU++Gw4Ax7CbsTA803DExvkuW77EKuIkfxpu+cF1i6x+numYQ?=
 =?us-ascii?Q?gAUUJnTvaX7vcb0K+H0OyIFMTa4GMyQkoL2xztF69htFZ2L2wXJRmN3GhYuP?=
 =?us-ascii?Q?gRlzzTLubdEFQgfBHe80m2e7++GBUSjaOZUT6ctLJo5i9ac03/Sg1aAbtU9P?=
 =?us-ascii?Q?XoRWReKBYvUkV0zD1YM/Gd7EiWlsiQ+vboqUS9zDIX/inpMlIaLRwgZCpn6B?=
 =?us-ascii?Q?2szv+GLvnc7bC79rfP2tl+3LEKIZ2I8t1aChlUrZ9rgNpYOoLEXlLxxeLcUZ?=
 =?us-ascii?Q?d7Vwcrk/rzGlBFSNovsa0X2++UxQMNRF3f+4HVzMz9Y8e99L36Mtp363ivQn?=
 =?us-ascii?Q?njZL9hJzXMpj7va5AqIIREVzzauVLIIu6wuhtVb4FmLJluhaH5n7fmveuo82?=
 =?us-ascii?Q?11tf+1OpJfEQRvSb7AxB1Q/+U90C9tZQzKBK0+8p17Ycg9ts0V4sD4NBgzTb?=
 =?us-ascii?Q?G1SJyec82h4ff6jKVOhzbd22g6PovPw+QMdrAYYn9V2bGT6Qf8J07TT10YJG?=
 =?us-ascii?Q?pfclZexKI2wx5PFWbqm/yjT1PwgVBcVTyMOYWrfYFMtvrqDyqwMDodwstQsQ?=
 =?us-ascii?Q?n3yIiK0saVgKDQM3w6+hFMT4rKUx3xhOAC+ZzCqjRG0/ywlvFZjtoQkr3JYw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	LBxMJ7hM6KPJF6fbxik23k9IKdZI+Q+Lz7e3rQsPJm3+10kK2hUux+wUxhXk5ygLsd3wzzYMIEvx9oztZsT3chTeejc2fqUv5WeJM+QqS3z0CGyLuAILIgOKX12s3kA3J5F5RY4/Am7MPtoKRQO0vVZn7kCtgfB1WirABJDSA8zG4PWShH9klpARZL4lGHALtnPF/VQ/FZ0mkglaDk/fltfBIPmN6U/ss4Xm0P8p+d9/bUHaXcK6uWBpDLGPLUQKmQD4JrdiGtG3wSfHbwVAuugsS8/DW3z/EzXHiwyOHKtIwyFMPBHZCVfjVfLLLBVrXb0PaePIkBS1wyoKeagyoDfaKpr8s3HuRKQvlUt8WL1Tlt0TSKcsUwxiQ2N2NwETV+gp3+VXKQ2GhyCidPWtcN/Zl0h5/ZDEe6kq+Jyn5hQ70zcmFrLU9HD4eCpL8CtH7D2j6ygni2suuQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38af48c-2f5e-4f4d-5104-08db7d62f93b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:24.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XfJTWThMyUEtshSe2b2bfMZlcp2wiXC927gDjletvi4WJEkgQnA+MDtjw+nbLndUVWLiSvQcp2i8C/ikBrkG0QbLdIw8+QZ5oF9RMRVCY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: dhbSjrfEOCFpXoDloXa4_oc3xvHvlJ2a
X-Proofpoint-ORIG-GUID: dhbSjrfEOCFpXoDloXa4_oc3xvHvlJ2a
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

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7a27550ff3c1..1a6a6eb48a15 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1645,20 +1645,8 @@ config XIP_DEFLATED_DATA
 	  copied, saving some precious ROM space. A possible drawback is a
 	  slightly longer boot delay.
 
-config KEXEC
-	bool "Kexec system call (EXPERIMENTAL)"
-	depends on (!SMP || PM_SLEEP_SMP)
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.
+config ARCH_SUPPORTS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1668,17 +1656,8 @@ config ATAGS_PROC
 	  Should the atags used to boot the kernel be exported in an "atags"
 	  file in procfs. Useful with kexec.
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel (EXPERIMENTAL)"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec. The crash dump kernel must be compiled to a
-	  memory address not used by the main kernel
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

