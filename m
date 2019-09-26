Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82052BF411
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 15:31:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fG651sDjzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 23:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=synopsys.com
 (client-ip=198.182.47.102; helo=smtprelay-out1.synopsys.com;
 envelope-from=gustavo.pimentel@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="W78VO2CM";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="bgwZ/jI8"; 
 dkim-atps=neutral
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fG2T6LjzzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 23:27:58 +1000 (AEST)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AF538C047C;
 Thu, 26 Sep 2019 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569504474; bh=RcVHoIyMuYa0+ORjHm9F3rvtw7ADXjTmTGfP1BV93Fw=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=W78VO2CM6HwvEBLfMXY9rsCmAYYGglTmAVHSDqyh2x776gjVsFTjtIlqzwSqLBRqe
 VKO+QjPMjmgVBaZbCWN0yahREnDF63CvJfGmXbwP10L14vYkY+F6xlpfia6sLk1ADr
 pLv1n30Rse/4qdoVk3FZTnfBeRIzujmJGm1QuSoBFTQYRRYqxo5yhE5KDTQC6v2105
 sbacg5U1HUgVwffoa/7ik4mW6ydT+PXH0RZYFG1Qgr9tpKm8iHgXeeJdPfJhh+pUdS
 Z/keBaMPDcSgY0/MMI0Lecl9iYi+TFwZ8Elj+sFK+ayDyL1tVJdvrSDaEVuNZpWyDk
 DRy1jo/XwolAw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id B15FFA006A;
 Thu, 26 Sep 2019 13:27:52 +0000 (UTC)
Received: from US01WEHTC2.internal.synopsys.com (10.12.239.237) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Sep 2019 06:27:52 -0700
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Sep 2019 06:27:51 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 26 Sep 2019 06:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3Knr67duCJxCyL5Pjw7j654zmAYK2tyuQOA/XuYt/6vTuJiDzC4fh14VyWzEjjPFqE7TdGwih6HzhZaFQKHBZwoSNjWte6JFQP+ptCakArBX2DLbc9nrSz9GKxhDMgmy21QgaofYVfWMIahdzL51iPpQC23VPrGlhh/eI85gmuT0YVAUtsemsfrm5xxAfzC8gnwzSReftVoYyG5mdtrMu3ugZPy4YuDkgu1LrsXXZNrNK/VuMVe0jQd2Uzu7L2qtpyv32WuUOMnMh4thlty9kBzanSWNe44GmQXBVnYIHI3Tsz5j/LGkpmnl4PYWGhJV8Pk9pn8a53iM2zpwuQAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFuDYeI+syhjRy35fzytWHd5T5KIT+W/IdqBLk5+pZU=;
 b=Rr4x2oSwhBIrHfivkqQ4BmzX5PGw4ZDEUYn3CrRPAuIOj7/J3gpLTZgUaoaLslvhCVYyS+q9iH4IMPB2/x+UXLAfpyh5I8bFZ5bvahjudvOZ1zpsB3PmOp+wjmQVvg967LOaNZeVwGKwHDSIs1g+kActEPri9UqxNL4OGpiOrFySeidUoqJmPLbMfmrjmJsIuipjNIhwKyHPQs8uJkU0aKNpzyvuW4ZFusughY2lVwlsTZH0jAQGErNhUYE2Eh4j3d9PUs7xHjQn9q44S0VAw1iwZeLlVgsIIKFT77ctRR97R99TvOOH0ecs0CjXKSTnSoHEKclHx/TT3kZhBUWwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFuDYeI+syhjRy35fzytWHd5T5KIT+W/IdqBLk5+pZU=;
 b=bgwZ/jI8qOV9SNwdB6x7QofBpBtVbSqMQfkJtYbTcDrqF9AIVg2HltgmjXt6Wv67NLUm9PFVgu5SQt7HlrF0flTRbNIexfhbrf8Vs++POBFxnvKisLfbqc7AvQbRrwvQ89qcT+GaQpWqqHzaGNFt8aZ5De5Bk8m3qb9bE8hojXo=
Received: from DM6PR12MB4010.namprd12.prod.outlook.com (10.255.175.83) by
 DM6PR12MB4298.namprd12.prod.outlook.com (10.141.187.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Thu, 26 Sep 2019 13:27:49 +0000
Received: from DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684]) by DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684%5]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 13:27:49 +0000
From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "kishon@ti.com" <kishon@ti.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>,
 "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>,
 "roy.zang@nxp.com" <roy.zang@nxp.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 01/11] PCI: designware-ep: Add multiple PFs support for
 DWC
Thread-Topic: [PATCH v4 01/11] PCI: designware-ep: Add multiple PFs support
 for DWC
Thread-Index: AQHVcn/zVCtcbFYks060CZ/e4ohFPqc990Mw
Date: Thu, 26 Sep 2019 13:27:48 +0000
Message-ID: <DM6PR12MB40104161C121BB562C43C99CDA860@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-2-xiaowei.bao@nxp.com>
In-Reply-To: <20190924021849.3185-2-xiaowei.bao@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZ3VzdGF2b1xh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTZiMjhhYmYxLWUwNjEtMTFlOS05ODhmLWY4OTRj?=
 =?us-ascii?Q?MjczODA0MlxhbWUtdGVzdFw2YjI4YWJmMy1lMDYxLTExZTktOTg4Zi1mODk0?=
 =?us-ascii?Q?YzI3MzgwNDJib2R5LnR4dCIgc3o9IjIxMTExIiB0PSIxMzIxMzk3ODA2MzU5?=
 =?us-ascii?Q?NTc0NDEiIGg9ImJOQ3FHNFFGUmsrK2lTRC90dXZJelFLZmRyOD0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?REJHSUV0Ym5UVkFWKzdXeW5JSStrK1g3dGJLY2dqNlQ0T0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBRUdJWXpRQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
 =?us-ascii?Q?Z0JoQUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFI?=
 =?us-ascii?Q?UUFaUUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0Jo?=
 =?us-ascii?Q?QUcwQWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFi?=
 =?us-ascii?Q?Z0JsQUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1B?=
 =?us-ascii?Q?RzhBZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRB?=
 =?us-ascii?Q?QnpBRzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFI?=
 =?us-ascii?Q?a0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4?=
 =?us-ascii?Q?QWRBQnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHRUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VB?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0Jm?=
 =?us-ascii?Q?QUhFQWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?us-ascii?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ6QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFH?=
 =?us-ascii?Q?MEFYd0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpR?=
 =?us-ascii?Q?QjVBSGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gustavo@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9a6e05e-e1cb-4e59-258b-08d742855338
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4298; 
x-ms-traffictypediagnostic: DM6PR12MB4298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4298832D9CFB428299F984FEDA860@DM6PR12MB4298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(71200400001)(30864003)(71190400001)(7416002)(8936002)(81166006)(81156014)(8676002)(74316002)(7736002)(2201001)(305945005)(86362001)(25786009)(229853002)(6436002)(11346002)(5660300002)(446003)(256004)(2906002)(14444005)(486006)(53546011)(102836004)(476003)(6506007)(52536014)(6246003)(26005)(99286004)(33656002)(478600001)(55016002)(186003)(66446008)(64756008)(9686003)(66066001)(66946007)(76176011)(316002)(76116006)(7696005)(110136005)(2501003)(14454004)(6116002)(66476007)(66556008)(3846002)(921003)(1121003)(579004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB4298;
 H:DM6PR12MB4010.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iH3CQRo0uzqwnFjQYbZLR3RztyWslwxnv8w3OZV5x1izkaniVQnVYiaoO9lVMGmWxDYITEfMANVIbS2rjd8BxRb7gkYJ0sI+nPfgEa2t7ehM74twWwSvnPnyFI1ykCfj3Rdf2qbqbXeW6DTI1tljR/h/b5+JfcxHEkG27ymg/hZIqO0Ufi13yS0C7gONflbTP+bxpv6FbX4eCF2m604GY4hHd4pCHYSkBucaCvoHmpdroKuknUJJJU7kteeLYJAErPVXmn4/DYGt2hiuILQnsAq7BgSq/tNC/YjNNwk2PQR13643q5L7avaaytzOgZ114jLWwLvagtZsVE0U0U3+44TbeyqpDX2QnIm1JsKlrG75eanqp9sXJ3PPBzWbHElNaATnRP/cI00h8D55B5O/VYWHB15cReo+p6neauXkmWQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6e05e-e1cb-4e59-258b-08d742855338
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 13:27:48.8587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/xKQMSanfEDR6AP5zbB5oBzkmfig3pm41k9RBMemJ0AvPCqvDvdSaLHop0T8keAVvFc+TMuHyaQ4d0OvT1icQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
X-OriginatorOrg: synopsys.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 3:18:39, Xiaowei Bao <xiaowei.bao@nxp.com> wrote:

> Add multiple PFs support for DWC, due to different PF have different
> config space, we use func_conf_select callback function to access
> the different PF's config space, the different chip company need to
> implement this callback function when use the DWC IP core and intend
> to support multiple PFs feature.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Remove duplicate redundant code.
>  - Reimplement the PF config space access way.
> v3:
>  - Integrate duplicate code for func_select.
>  - Move PCIE_ATU_FUNC_NUM(pf) (pf << 20) to ((pf) << 20).
>  - Add the comments for func_conf_select function.
> v4:
>  - Correct the commit message.
>=20
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 123 ++++++++++++++++--=
------
>  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
>  drivers/pci/controller/dwc/pcie-designware.h    |  18 +++-
>  3 files changed, 142 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pc=
i/controller/dwc/pcie-designware-ep.c
> index 65f4792..eb851c2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,12 +19,26 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
> =20
> -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno b=
ar,
> -				   int flags)
> +static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 fun=
c_no)
> +{
> +	unsigned int func_offset =3D 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset =3D ep->ops->func_conf_select(ep, func_no);
> +
> +	return func_offset;
> +}
> +
> +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> +				   enum pci_barno bar, int flags)
>  {
>  	u32 reg;
> +	unsigned int func_offset =3D 0;
> +	struct dw_pcie_ep *ep =3D &pci->ep;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> =20
> -	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg =3D func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg, 0x0);
>  	dw_pcie_writel_dbi(pci, reg, 0x0);
> @@ -37,7 +51,12 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci=
, enum pci_barno bar,
> =20
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
> -	__dw_pcie_ep_reset_bar(pci, bar, 0);
> +	u8 func_no, funcs;
> +
> +	funcs =3D pci->ep.epc->max_functions;
> +
> +	for (func_no =3D 0; func_no < funcs; func_no++)
> +		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
>  }
> =20
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
> @@ -45,28 +64,31 @@ static int dw_pcie_ep_write_header(struct pci_epc *ep=
c, u8 func_no,
>  {
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	unsigned int func_offset =3D 0;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> =20
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code)=
;
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id)=
;
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
>  			   hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
> =20
>  	return 0;
>  }
> =20
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno =
bar,
> -				  dma_addr_t cpu_addr,
> +static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				  enum pci_barno bar, dma_addr_t cpu_addr,
>  				  enum dw_pcie_as_type as_type)
>  {
>  	int ret;
> @@ -79,7 +101,7 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *e=
p, enum pci_barno bar,
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
> +	ret =3D dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar, cpu_addr,
>  				       as_type);
>  	if (ret < 0) {
>  		dev_err(pci->dev, "Failed to program IB window\n");
> @@ -92,7 +114,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *e=
p, enum pci_barno bar,
>  	return 0;
>  }
> =20
> -static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t ph=
ys_addr,
> +static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				   phys_addr_t phys_addr,
>  				   u64 pci_addr, size_t size)
>  {
>  	u32 free_win;
> @@ -104,8 +127,8 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep =
*ep, phys_addr_t phys_addr,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
> -				  phys_addr, pci_addr, size);
> +	dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM,
> +				     phys_addr, pci_addr, size);
> =20
>  	set_bit(free_win, ep->ob_window_map);
>  	ep->outbound_addr[free_win] =3D phys_addr;
> @@ -121,7 +144,7 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc,=
 u8 func_no,
>  	enum pci_barno bar =3D epf_bar->barno;
>  	u32 atu_index =3D ep->bar_to_atu[bar];
> =20
> -	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
> +	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
> =20
>  	dw_pcie_disable_atu(pci, atu_index, DW_PCIE_REGION_INBOUND);
>  	clear_bit(atu_index, ep->ib_window_map);
> @@ -137,14 +160,20 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, =
u8 func_no,
>  	size_t size =3D epf_bar->size;
>  	int flags =3D epf_bar->flags;
>  	enum dw_pcie_as_type as_type;
> -	u32 reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 reg;
> +	unsigned int func_offset =3D 0;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
> =20
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
>  		as_type =3D DW_PCIE_AS_MEM;
>  	else
>  		as_type =3D DW_PCIE_AS_IO;
> =20
> -	ret =3D dw_pcie_ep_inbound_atu(ep, bar, epf_bar->phys_addr, as_type);
> +	ret =3D dw_pcie_ep_inbound_atu(ep, func_no, bar,
> +				     epf_bar->phys_addr, as_type);
>  	if (ret)
>  		return ret;
> =20
> @@ -202,7 +231,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u=
8 func_no,
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> =20
> -	ret =3D dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> +	ret =3D dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
>  	if (ret) {
>  		dev_err(pci->dev, "Failed to enable address\n");
>  		return ret;
> @@ -216,11 +245,14 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, =
u8 func_no)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -235,11 +267,14 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, =
u8 func_no, u8 interrupts)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	val &=3D ~PCI_MSI_FLAGS_QMASK;
>  	val |=3D (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -255,11 +290,14 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc,=
 u8 func_no)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msix_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -274,11 +312,14 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc,=
 u8 func_no, u16 interrupts)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msix_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	val &=3D ~PCI_MSIX_FLAGS_QSIZE;
>  	val |=3D interrupts;
> @@ -365,6 +406,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u=
8 func_no,
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc =3D ep->epc;
>  	unsigned int aligned_offset;
> +	unsigned int func_offset =3D 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
> @@ -374,20 +416,22 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep,=
 u8 func_no,
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. *=
/
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	msg_ctrl =3D dw_pcie_readw_dbi(pci, reg);
>  	has_upper =3D !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg =3D ep->msi_cap + PCI_MSI_ADDRESS_LO;
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg =3D ep->msi_cap + PCI_MSI_ADDRESS_HI;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper =3D dw_pcie_readl_dbi(pci, reg);
> -		reg =3D ep->msi_cap + PCI_MSI_DATA_64;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_DATA_64;
>  		msg_data =3D dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper =3D 0;
> -		reg =3D ep->msi_cap + PCI_MSI_DATA_32;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_DATA_32;
>  		msg_data =3D dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset =3D msg_addr_lower & (epc->mem->page_size - 1);
> @@ -406,11 +450,12 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep,=
 u8 func_no,
>  }
> =20
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> -			     u16 interrupt_num)
> +			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc =3D ep->epc;
>  	u16 tbl_offset, bir;
> +	unsigned int func_offset =3D 0;
>  	u32 bar_addr_upper, bar_addr_lower;
>  	u32 msg_addr_upper, msg_addr_lower;
>  	u32 reg, msg_data, vec_ctrl;
> @@ -418,12 +463,14 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep=
, u8 func_no,
>  	void __iomem *msix_tbl;
>  	int ret;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_TABLE;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_TABLE;
>  	tbl_offset =3D dw_pcie_readl_dbi(pci, reg);
>  	bir =3D (tbl_offset & PCI_MSIX_TABLE_BIR);
>  	tbl_offset &=3D PCI_MSIX_TABLE_OFFSET;
> =20
> -	reg =3D PCI_BASE_ADDRESS_0 + (4 * bir);
> +	reg =3D PCI_BASE_ADDRESS_0 + func_offset + (4 * bir);
>  	bar_addr_upper =3D 0;
>  	bar_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
>  	reg_u64 =3D (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> @@ -559,13 +606,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	ep->epc =3D epc;
>  	epc_set_drvdata(epc, ep);
> =20
> -	if (ep->ops->ep_init)
> -		ep->ops->ep_init(ep);
> -
>  	ret =3D of_property_read_u8(np, "max-functions", &epc->max_functions);
>  	if (ret < 0)
>  		epc->max_functions =3D 1;
> =20
> +	if (ep->ops->ep_init)
> +		ep->ops->ep_init(ep);
> +
>  	ret =3D __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  				 ep->page_size);
>  	if (ret < 0) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/c=
ontroller/dwc/pcie-designware.c
> index 143cb6c..ede2e75 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -238,9 +238,10 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie =
*pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
> =20
> -static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int in=
dex,
> -					     int type, u64 cpu_addr,
> -					     u64 pci_addr, u32 size)
> +static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, u8 fun=
c_no,
> +					     int index, int type,
> +					     u64 cpu_addr, u64 pci_addr,
> +					     u32 size)
>  {
>  	u32 retries, val;
> =20
> @@ -255,7 +256,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
>  				 upper_32_bits(pci_addr));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> -				 type);
> +				 type | PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
>  				 PCIE_ATU_ENABLE);
> =20
> @@ -274,8 +275,9 @@ static void dw_pcie_prog_outbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
> =20
> -void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> -			       u64 cpu_addr, u64 pci_addr, u32 size)
> +static void __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
> +					int index, int type, u64 cpu_addr,
> +					u64 pci_addr, u32 size)
>  {
>  	u32 retries, val;
> =20
> @@ -283,8 +285,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, i=
nt index, int type,
>  		cpu_addr =3D pci->ops->cpu_addr_fixup(pci, cpu_addr);
> =20
>  	if (pci->iatu_unroll_enabled) {
> -		dw_pcie_prog_outbound_atu_unroll(pci, index, type, cpu_addr,
> -						 pci_addr, size);
> +		dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
> +						 cpu_addr, pci_addr, size);
>  		return;
>  	}
> =20
> @@ -300,7 +302,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, i=
nt index, int type,
>  			   lower_32_bits(pci_addr));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
>  			   upper_32_bits(pci_addr));
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> =20
>  	/*
> @@ -317,6 +320,21 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, =
int index, int type,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
> =20
> +void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> +			       u64 cpu_addr, u64 pci_addr, u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, 0, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int i=
ndex,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, func_no, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
>  static u32 dw_pcie_readl_ib_unroll(struct dw_pcie *pci, u32 index, u32 r=
eg)
>  {
>  	u32 offset =3D PCIE_GET_ATU_INB_UNR_REG_OFFSET(index);
> @@ -332,8 +350,8 @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *=
pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
> =20
> -static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int inde=
x,
> -					   int bar, u64 cpu_addr,
> +static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, u8 func_=
no,
> +					   int index, int bar, u64 cpu_addr,
>  					   enum dw_pcie_as_type as_type)
>  {
>  	int type;
> @@ -355,8 +373,10 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw=
_pcie *pci, int index,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type);
> +	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type |
> +				 PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +				 PCIE_ATU_FUNC_NUM_MATCH_EN |
>  				 PCIE_ATU_ENABLE |
>  				 PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> =20
> @@ -377,14 +397,15 @@ static int dw_pcie_prog_inbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	return -EBUSY;
>  }
> =20
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type)
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type)
>  {
>  	int type;
>  	u32 retries, val;
> =20
>  	if (pci->iatu_unroll_enabled)
> -		return dw_pcie_prog_inbound_atu_unroll(pci, index, bar,
> +		return dw_pcie_prog_inbound_atu_unroll(pci, func_no, index, bar,
>  						       cpu_addr, as_type);
> =20
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_INBOUND |
> @@ -403,9 +424,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, in=
t index, int bar,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE
> -			   | PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE |
> +			   PCIE_ATU_FUNC_NUM_MATCH_EN |
> +			   PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> =20
>  	/*
>  	 * Make sure ATU enable takes effect before any subsequent config
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/c=
ontroller/dwc/pcie-designware.h
> index 5a18e94..6aca0bb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -71,9 +71,11 @@
>  #define PCIE_ATU_TYPE_IO		0x2
>  #define PCIE_ATU_TYPE_CFG0		0x4
>  #define PCIE_ATU_TYPE_CFG1		0x5
> +#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
>  #define PCIE_ATU_CR2			0x908
>  #define PCIE_ATU_ENABLE			BIT(31)
>  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>  #define PCIE_ATU_LOWER_BASE		0x90C
>  #define PCIE_ATU_UPPER_BASE		0x910
>  #define PCIE_ATU_LIMIT			0x914
> @@ -206,6 +208,14 @@ struct dw_pcie_ep_ops {
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     enum pci_epc_irq_type type, u16 interrupt_num);
>  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> +	/*
> +	 * Provide a method to implement the different func config space
> +	 * access for different platform, if different func have different
> +	 * offset, return the offset of func. if use write a register way
> +	 * return a 0, and implement code in callback function of platform
> +	 * driver.
> +	 */
> +	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
>  };
> =20
>  struct dw_pcie_ep {
> @@ -277,8 +287,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
>  void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
>  			       int type, u64 cpu_addr, u64 pci_addr,
>  			       u32 size);
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type);
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int i=
ndex,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size);
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type);
>  void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
>  			 enum dw_pcie_region_type type);
>  void dw_pcie_setup(struct dw_pcie *pci);
> --=20
> 2.9.5


Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>


