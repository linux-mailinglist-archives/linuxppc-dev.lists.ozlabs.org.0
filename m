Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2367147B147
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlf10Xqmz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldW459yz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG74DhiTpl39WKzMHOs8zlbBSwdyx/74o0iv6VU6AAoBFh/IuJumQzUFHKYFyluVud2w3yugNcbJbCK7KunJJeZMqAOlvo1p72yOMPp8Je9cAQNy94F0WuD3sk3+I3CGYd0D1PWqhe+9k9ezJ8VlZqnOXJJasztlgeXgJutjfXNNBV3gTRgTCMnbb8umFbzfTQpV47f2G6HnxTLNSGjqrhTfNCRH5hn/lp0Yovq1nbPhPHd/8PzS8KbJXmJlupOYAr7tdWeAgqMio+wzAnzoKjg/Rf+6friibjeOWDzap/4CPcE8L5LPMJN134r7e1+rx3pFq+6Ah9LqTmjdjvrVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BrwoWtE2UnsM1fo+U5ZkqfBLZjUDvcSYIAfBP6zb7s=;
 b=bBJDOgAnxlxY3jCjWRdk9lL0OmgJMYNY2GM5iU+KhYDCoKb2dlHBsUs2RDVETzKsaYaFjcSjYtAN75gHtxwtHxXHE18DMSj4/wPyrI4QwLwm0iARp22maHKRLgRl+Xb1Hme6ZtyhKOCsUhfk3LRR+xLbU02xlY4lKbtqJeh6j4CIHFR4zlhEk30XENZWI5OmVeN3VY3Q2W8Dvzf5s9y+Jtbs0AF9Z92HCsbMgUVREn6hjWCJ2WL0BP6MLQ4UahoBH6IxGQhvmGAaxnNTQPX+Kq3vnRDROZslTKVYeGkoaf+rwDbJyk/abKbSf6rChiXBqDOTM0m1xO9a3zAHyPLwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:37:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:37:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 00/13] Implement livepatch on PPC32 and more
Thread-Topic: [PATCH v2 00/13] Implement livepatch on PPC32 and more
Thread-Index: AQHX9b/yHKLwJ2BvN0CibIvpSgqRSg==
Date: Mon, 20 Dec 2021 16:37:58 +0000
Message-ID: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94f7b629-0f07-44e3-3247-08d9c3d714e6
x-ms-traffictypediagnostic: MR1P264MB1905:EE_
x-microsoft-antispam-prvs: <MR1P264MB19052811699F3C095635B695ED7B9@MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3yBXqNt7p1ii5ClLokrtpXu7XNOBKGZgXPZZWc7cEvAVOmEVWmfLIbhti3PIkCCOiFcrQqRiFWE1yJMUJBRqQS4X863XhbbMAHpFuG6y4bxzlaHube0bq9l//b6F9qkxxBWW/HRhfdGsuAn/sD2DcIDuyfNeaSuno7DKJpuvr6N/j81sH4wCRMaRojJiBqu/hPVsZ0c5vYXTTkyFEfrpPr8/UlxoEhRaNBADV1y977rDtrckd4TG4IF5BYNucy+WcFW99eAw3ZBFtpHNGS5rbE5C53s20+iH8ih6922Jl2Y4HaTtnJxbcEV1Y7LReKTS4ZCanw3/+NgopYSRn7ACfHFn19iL5p6QwUch5iFnd5y1f3qnssfcF/jJ7qK4QjrCpI3bQjL+pj/J9cPWIYvn8CrCzpbajp6eNeYM8/cHyCiLk8qjDP5nEH4dQ6WTVJZusFJ+EQF0Ts/3FGW0Eo+S5Ju7lhXkfiCUxB+0WcHtqF6EAcfzuY6Sf9guZ/wIToDVdXiluzpoewk1phrheo632dzeQBcR1iMQsHUa5btnwzOrN2F/WGewWp2kjLjWdtaqyzxKr8bmRo5AZNhkRGE6oP9FZL2U9q2mcIVOwh9c38kEwJC7rcurBlZNM8Gx56FWooq0FQ5pzVmwzbKM/EcjQQMAKLK4aEl/C1ov9htv3hLojYtWM5OtB0ycMawuE2Dg/tQ2H3xnVsFVRuGFaBxfXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(86362001)(36756003)(316002)(110136005)(6512007)(54906003)(71200400001)(6506007)(38070700005)(83380400001)(8936002)(2906002)(122000001)(6486002)(38100700002)(8676002)(44832011)(66446008)(5660300002)(66946007)(66556008)(26005)(76116006)(4326008)(91956017)(7416002)(2616005)(64756008)(186003)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6b8DZK3ol8tih+WuejfoPyG6T/j0GpPxE14pUhdEtPPpPe7EBxA9LAj8Fk?=
 =?iso-8859-1?Q?cB40gpcm4TMmuj3cWWj+T4tn2nSmfYF7l6O6cdvVauYhQkTzVtkiHQNGVY?=
 =?iso-8859-1?Q?9D6k+2sqjYp28USvbp/P5faIrLO67nqNjqg9onCdzl/oMlW2m0wwSqOwnY?=
 =?iso-8859-1?Q?NSMi7Zmiyk8dZdRQ3fCWA2xQBkVzb7UZqdmKQiQxYD1TRhv2DDlZjsPA4v?=
 =?iso-8859-1?Q?gbRVSaHkqA5SPRWjK1JX7POqD21ZJtXXe8tun1O5vFtEOtkbw2NSBoojsF?=
 =?iso-8859-1?Q?s4Vo9TLyTzJpDfugDTwGcsMKXZ7Agy0emSWPOy953LAO3NhPwVHSd4uOt+?=
 =?iso-8859-1?Q?1v0l/lfu1evm6wzUl7/V0eHryxX8RuedY+asQW0jMZRiBc0d2F66vOdGJP?=
 =?iso-8859-1?Q?u9x5bWaIKWhdbrFAo2S7wRguMG/0xSd7cJCpHRF/ZottALgt7R7dwb5pJu?=
 =?iso-8859-1?Q?ltVyjcrAr3gAY0KZXqpbh3WazxZdqHyjA3dxuVtfI8lVsF/beIc1QsHMvo?=
 =?iso-8859-1?Q?BMVzT8nYWdmg6KCY+V2OtYWc9d58SbLiAE22Oqg44wT2scT5j9jRZB0Z1F?=
 =?iso-8859-1?Q?42c2/FZE8qzpl2Wl5Rp6yAcWTr3YARzIj6nzYuUF9XjMIaITGE5/Nf9JMV?=
 =?iso-8859-1?Q?xL2cCSPlI/ouyPn1pCbvcv/Q5k5fZuU0398Hi82GiopR7B0I2FIrW1ltmk?=
 =?iso-8859-1?Q?BEE3uxN3JXZKVqCnaoHnvlhSJZs5b4JKvU1wuQweXXPKLi07QTp93kYb5j?=
 =?iso-8859-1?Q?9FQsnjnZIrxvijrGTM4Th0ETOKlD3QK1zE6vRA3SylSuGap870r0MIB9UV?=
 =?iso-8859-1?Q?tqINmj9dAwrWZYXS7m8DDrbWbUYdLsyKGtOSmQ0rvHHhquCxzmT3IGKzpF?=
 =?iso-8859-1?Q?l3n6MSNq8Xir3Z2Kfv4s9G3B4XQ2ICuKOVZUulyuXVdHmHnQRJ00xTGdL7?=
 =?iso-8859-1?Q?2DBzJpozwRyQsT9q1/JQ0fsdzNfHjDpQcInhImyDcFjjHJXYjiWy8xxXfO?=
 =?iso-8859-1?Q?sYoXrrI/iAjq9K8GqSg4A/bRo+xZGnO6815Y7ol/jxUVyrGc09exJV7tj+?=
 =?iso-8859-1?Q?T8mPccypQC33bUze7D6aOCoHHE76fBTe2PdeR7ugL25ScTUi/VPLZOC+D3?=
 =?iso-8859-1?Q?9ur5gJqtmegr6re3Iqu7FOSi5NCtyS5honNfslPqL8URR1DpmC/ckZsMGw?=
 =?iso-8859-1?Q?cG0fmM0NdgRrbTAjWC5YaTXwXafzrVx9hGm4Ap1i7JC8Bc4X9l1EwcnfRn?=
 =?iso-8859-1?Q?B1FS1y3V+U7YRh1toQd53xXss4CMcyVqEJfx/Q51KOp82oj4RcSPjlI3ug?=
 =?iso-8859-1?Q?lDCymEzisruio2jT4VvG0jJqcVDefnkd7StoHkjWq/v4JDwA3XHlq9Ve4d?=
 =?iso-8859-1?Q?EvvQGXTkp+Wb2W0gvyZThfQKuX5lgVhLgePotJhHOMR6KhP4ZI8Lir4oZm?=
 =?iso-8859-1?Q?z/nLYhtxmwzcwMVKiU3HpRVeYA5GtDS0xmzOWE+p9exBX4eMlapWotHCmK?=
 =?iso-8859-1?Q?R41g+d5GK9U98hQEBuq6zXbCji2AYVEjHKvKW6axkBJTl0QkunLqaNwfKc?=
 =?iso-8859-1?Q?izBjTFvxelwmylwT+3QZNIseyEmqhW5WYlLPVo4kuoKdUeYMCXTMb7GDkd?=
 =?iso-8859-1?Q?30lHMIaovjyXmqx9/EhjgLM/X63npgFepNKY3K9X2c8FCDFTzeelYorxWx?=
 =?iso-8859-1?Q?1O9HTyFhHMJ2RdUosbznmF1rVu3b2hhvyPIYycWPNTvuvN1GD5JLxqD3Up?=
 =?iso-8859-1?Q?LbhQFhCkFgPJYrj1l40TPsYmk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f7b629-0f07-44e3-3247-08d9c3d714e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:37:58.4713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgYGW/G+CK2d31Ne91VmVm0Akp8RqptnLaoKB2rrVwoySTyQe5NIBnezxefsUdxtDw1QXq0KhLYgBmHo6hD/BamZ0N5JUO6yllYlUqGGI3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1905
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series implements livepatch on PPC32 and implements
CONFIG_DYNAMIC_FTRACE_WITH_ARGS to simplify ftracing.

v2:
- Fix problem with strict modules RWX
- Convert powerpc to CONFIG_DYNAMIC_FTRACE_WITH_ARGS
- Convert function graph tracing to C
- Refactor PPC32 versus PPC64

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Christophe Leroy (13):
  livepatch: Fix build failure on 32 bits processors
  tracing: Fix selftest config check for function graph start up test
  powerpc/module_32: Fix livepatching for RO modules
  powerpc/ftrace: Add support for livepatch to PPC32
  powerpc/ftrace: Don't save again LR in ftrace_regs_caller() on PPC32
  powerpc/ftrace: Simplify PPC32's return_to_handler()
  powerpc/ftrace: Prepare PPC32's ftrace_caller() for
    CONFIG_DYNAMIC_FTRACE_WITH_ARGS
  powerpc/ftrace: Prepare PPC64's ftrace_caller() for
    CONFIG_DYNAMIC_FTRACE_WITH_ARGS
  powerpc/ftrace: Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS
  powerpc/ftrace: Refactor ftrace_{en/dis}able_ftrace_graph_caller
  powerpc/ftrace: directly call of function graph tracer by ftrace
    caller
  powerpc/ftrace: Prepare ftrace_64_mprofile.S for reuse by PPC32
  powerpc/ftrace: Remove ftrace_32.S

 arch/powerpc/Kconfig                          |   7 +-
 arch/powerpc/include/asm/ftrace.h             |  62 +++---
 arch/powerpc/include/asm/livepatch.h          |  12 +-
 arch/powerpc/include/asm/thread_info.h        |   2 +-
 arch/powerpc/kernel/asm-offsets.c             |   2 +-
 arch/powerpc/kernel/module_32.c               |  44 +++--
 arch/powerpc/kernel/trace/Makefile            |   7 +-
 arch/powerpc/kernel/trace/ftrace.c            |  32 +--
 arch/powerpc/kernel/trace/ftrace_32.S         | 187 ------------------
 .../trace/{ftrace_64.S =3D> ftrace_low.S}       |  14 ++
 ...ftrace_64_mprofile.S =3D> ftrace_mprofile.S} | 158 +++++++--------
 kernel/livepatch/core.c                       |   4 +-
 kernel/trace/trace_selftest.c                 |   6 +-
 13 files changed, 178 insertions(+), 359 deletions(-)
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_32.S
 rename arch/powerpc/kernel/trace/{ftrace_64.S =3D> ftrace_low.S} (85%)
 rename arch/powerpc/kernel/trace/{ftrace_64_mprofile.S =3D> ftrace_mprofil=
e.S} (75%)

--=20
2.33.1
