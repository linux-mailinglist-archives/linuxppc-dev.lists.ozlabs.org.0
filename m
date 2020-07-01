Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2421132B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 21:02:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xrF03cPKzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 05:01:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xrC96wjqzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 05:00:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=eTIZ8mQ5; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49xrC93MxVz9CvX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 05:00:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49xrC92pfkz9sDX; Thu,  2 Jul 2020 05:00:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.220.86;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=eTIZ8mQ5; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49xrC76Jwgz9sR4
 for <linuxppc-dev@ozlabs.org>; Thu,  2 Jul 2020 05:00:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUGfOuruM7kstgLtCpHp5PjDeL0OsVxXLEEGuLs/B0k8LO7gMH1JJtK4mR1H6hsh3dDoIzoNMFuDa53xqAp/vrD0xhHrbddaNmg8XmwIdapZfiHVF+1JA2+I6noWoxWx4QF7OXLUKRCzmfCaFHGubCb1yEeL9ayFZRn/qmA5iP0iOPgsNG3t5ERkBF3xFnXC4v8CgIW2unl1z7ZEgxlEF7tNyhzXJ1LDKZQPzt6h6EYY7RgDuHMyfOT9RtGAKy1QEScKmp+hT1ryRZgIrIgdjSsC+J0zgkXugImnKV02I6AcOEiBwSrDeftukpX0OZzBWBZhsrXU6DKqG6HK0oD0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiONRZI5sfs1eT/kR6O3LaapfgxolQOoaklFmzqeJvE=;
 b=ftNAyDJwdIFv10NIczr7xxuDitpMgJPidUYJrKn1YyCyv0PIEO9y+YxtyuFdlam9nK2JQJLI5Lh9GgUCegSgq3xWXtnv90vPlGbf94GTtgc45+rNUTrea9cE5I70lxt8QrDWWJ2GFUJSRyPj9w9OdstFMwC4BsyeTbXscg3AYp1NNECiEDXITmvvDu2vLRBPf8gqpPPkHmHNU9wGEBvEKnTzh+9W+aEaVafYHL8znZVSDgfyHAYUNYchPfh+Skbqjw2z4fTWb04Gk3VsY09sH780offw0hSzcL9vHhXStNMumbrqgOFAP2TZbWyooLsvZog84U9TrkLEG5H1NRkJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiONRZI5sfs1eT/kR6O3LaapfgxolQOoaklFmzqeJvE=;
 b=eTIZ8mQ5a8xvS6siZNbdaC4JmN4G9ktAfFW3RqC/x54DV7NOclCTjXPYpYGXSNk+/qb4gcApgzcAdH2MB62aew0M8EFAv+LuGjWPgWyBlgjXd8KVLKgR4q5hO4K7ATGYlfo9Kg6+l/isit4PuuEgYmBgGwC5wJ9xqFoAKSygLqk=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR1001MB2189.namprd10.prod.outlook.com
 (2603:10b6:301:36::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 19:00:11 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3153.023; Wed, 1 Jul 2020
 19:00:11 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Memory:  880608K/983040K  .... 36896K reserved ?
Thread-Topic: Memory:  880608K/983040K  .... 36896K reserved ?
Thread-Index: AQHWT9nYdrAV3GgFb0iej/lsd9LC/g==
Date: Wed, 1 Jul 2020 19:00:10 +0000
Message-ID: <a598dcaea9e62379c74d1d78083d92898373c4de.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: ozlabs.org; dkim=none (message not signed)
 header.d=none;ozlabs.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 707ad7e5-568a-4bbb-8cc9-08d81df0fb49
x-ms-traffictypediagnostic: MWHPR1001MB2189:
x-microsoft-antispam-prvs: <MWHPR1001MB2189C5B98473EFFD24669655F46C0@MWHPR1001MB2189.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l8oKcF463vJh3Z31SGzid79uepnyyIlgRUpd9niu6bQkX+LJzRQvLAVTW7e70LihioFZKkVdlFgP+0vJLkALXoQDeK1tb39Oxch3PH8BfvpQVN5Fs7wo839zzrS5IMdcBS0bjm0OOI1Ol+Ni0mgKaEbu5d0ma1XnLREuRHZ8wYn+OqHYYfiWJwNFNlEL68NR6hXBRpdQ2P2FwMQJl4830GssihhC4CSouzucNV9Sj+0Tx0cvdkjpS88nvGcTt27Yx6DVPRS6o9ysNKQbN/4xPpAmbk3kBEP2k+EwmY4DY5rm7hElTl93t/8o/jf8O5MPRZVGDszJ2PPExWhItVUe4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2190.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(2616005)(8676002)(8936002)(64756008)(66556008)(66476007)(66946007)(558084003)(76116006)(91956017)(66446008)(6506007)(478600001)(316002)(6916009)(86362001)(26005)(5660300002)(6512007)(6486002)(71200400001)(186003)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: paTh4i+H+kcn/8kQ/b/MLob6CWFT0efxsHBM0oh4vw5MdYp3JUYBs5xHwSTiEfUSwmzD5VtHUIQRxOkO2KT8fCZzUOKXNnjXVPJPwMQoTKrWYQ+u5gFCbRP8XiRS87LfKKt82dCYHiMPgr9WD3/8XiYA6LRm18IZr3cy1Oi9YyG1O1DswE2wDjnzveJNlKB3kqW6e4zUMYSsaORauz5PZDnFRSwjFu2kPhkRcIUHi7ZmTcrW8SHuZAqdMbCiMaXsT51gcoQVytDHl8EcdVM27r4JK71mV3CBixXYd+859w/tOr6it/uWFNcQCPoZgiWDP4FAi22SvksNiuUC4FY9zB4mKvisIQgHurRvCUeIK3i7M3YlqFC6RsS900BZQRROAecbeLJ92Tlko5epQCWH+uz68aaBMHFgEul7M7pWeDCbDpU9ZM8dWxdPwJsKYz8m3YB3f6j3T0WRb3yMaHzBlz8p1zqskA4kw3M3d0jdDtQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <416627BA00DFE74183AAF609AF8890CB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2190.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707ad7e5-568a-4bbb-8cc9-08d81df0fb49
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 19:00:11.6820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHfsev2qDJRiZv89vbHYaMs5Mfo2CPj0QUO4UsX9U/E9YqiW8fy9rNIm1cWP9TVeLmR0jUQBFNMYbJDLsdWhbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2189
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

SSBjYW5ub3QgZmlndXJlIG91dCBob3cgdGhlIHh4eEsgcmVzZXJ2ZWQgaXRlbSB3b3JrcyBpbjoN
CiBNZW1vcnk6IDg4MDYwOEsvOTgzMDQwSyBhdmFpbGFibGUgKDk1MzJLIGtlcm5lbCBjb2RlLCAx
MTA0SyByd2RhdGEsIDMzNDhLIHJvZGF0YSwgMTA4OEsgaW5pdCwgMTIwMUsgYnNzLCAzNjg5Nksg
cmVzZXJ2ZWQgLi4uDQoNCklzIHRoZXJlIGEgd2F5IHRvIHR1bmUobG93ZXIgaXQpIHRoaXMgbWVt
b3J5Pw0KDQogSm9ja2UNCg==
