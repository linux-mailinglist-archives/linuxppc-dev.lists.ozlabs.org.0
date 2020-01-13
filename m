Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A94139AF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 21:49:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xQgf5mTVzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:49:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8281b9063c=songliubraving@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=K+bUezrV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=jRyZG3sQ; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xQdq4drZzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 07:47:58 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DKftlr004890; Mon, 13 Jan 2020 12:47:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XqTtxbMQ2UzsyuZCZ8lAx13lyT5t3RtvOoGzVOw8UyA=;
 b=K+bUezrVf4b4H1WAtbTnqOy7DtVIa/XmTbISVS8G3cVzzyq8XJ+mo3Ede1WVRBm4RTHk
 RKM2prW4EhNjAoUMjmrO0j9pEdWQgZviWjpyZEPbRUoFrCVd08en4FcvPODUFsJHcudG
 wX4Le1gX2lgyzXvbAJCNCZIGNOfZYazwpsQ= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xgw2egx8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 12:47:07 -0800
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 13 Jan 2020 12:47:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jan 2020 12:47:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxMtD+UI3GwJy+f/2g8V+EI1T1ZwhD3XbW4Qg4Ere2u99wVVBogxwdZQ12ROcqrIVd7g7D2fWHkm6ysKOJTQ6Wpy1fHEKP+l2HvBUQNnkPEBqP/ufWvu9FBLl01nJKv86r8cxODB+f55VfLsUbbBQFPf8c5mR5sncQ9D29/kts9xoZitil6joItJezJPsuCDq/bMC1GQPTuXLe2w7ITxQJBm5DOPZHeKtHubgrhTU1wx+fZ38PZjcvLMJ5ZPQpqn0G3gKswhqCSPuscoifvU89g3FieZVupzaSNmOrCXlp4/elho++xZVF3b3Pg5rJ2nQ9SgMhuGW0BeItN7gfFBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqTtxbMQ2UzsyuZCZ8lAx13lyT5t3RtvOoGzVOw8UyA=;
 b=AMHmmBG1CZhIpP37RW3iW114gCsjBBhOwOx/1ILI7jBY/T/tmaJQxMh9js5wMM+NLqF5qpHdO1D2eANIcLiglU+9yLEKxQa9IkbqncHYsZrnYpDoVh9yLT+L/ciR2oqybycvpktCLiHUPV/v74jPsb/F3oe9EbtGpguIHtCENm75QlJpGJeyXd8V8MGEgXAfwhfKzDlIoVxf/xE1aLuQtVW7jlQyTtfuDyfg6a3k7+ZWvbVPngkJAaEEE2fkqnKWoIsGqA9ghtJtQxkQAn6KCbPGY2qT7aq5ZwapbgV6yb45+NOm3fJTNPFK1Fmlcv9ew/WUxVGlwSxMackNDIRSMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqTtxbMQ2UzsyuZCZ8lAx13lyT5t3RtvOoGzVOw8UyA=;
 b=jRyZG3sQZIDfr3FKZQ9qUnH2jx5PvVSR5jwt1dHLWjAkfZ8Bm7b4uCl0vxMY2N5xamLdVn/GNv9F3fxiGqaEsfWWCLdbyMo0/0ZTrCJv70U1agGVANPEAiVFoyLLePVcfij2bAMHepOMwTSChL5H3WTs53UZGzFvsy7K79CB0rY=
Received: from BYAPR15MB3029.namprd15.prod.outlook.com (20.178.238.208) by
 BYAPR15MB2215.namprd15.prod.outlook.com (52.135.196.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 20:47:05 +0000
Received: from BYAPR15MB3029.namprd15.prod.outlook.com
 ([fe80::3541:85d8:c4c8:760d]) by BYAPR15MB3029.namprd15.prod.outlook.com
 ([fe80::3541:85d8:c4c8:760d%3]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 20:47:05 +0000
From: Song Liu <songliubraving@fb.com>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v4 5/9] trace/bpf_trace: open access for CAP_SYS_PERFMON
 privileged process
Thread-Topic: [PATCH v4 5/9] trace/bpf_trace: open access for CAP_SYS_PERFMON
 privileged process
Thread-Index: AQHVtYWFShQHtNvcRUuY/VfR2deyJafpOi4A
Date: Mon, 13 Jan 2020 20:47:04 +0000
Message-ID: <D11073C5-BF5D-4FAB-AC38-D640152DA0A4@fb.com>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <1d46cc07-ced7-9a29-a9a3-3cba6ef2df21@linux.intel.com>
In-Reply-To: <1d46cc07-ced7-9a29-a9a3-3cba6ef2df21@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-originating-ip: [2620:10d:c090:200::6df5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0304726-4b48-4085-2a9d-08d79869bfa9
x-ms-traffictypediagnostic: BYAPR15MB2215:
x-microsoft-antispam-prvs: <BYAPR15MB2215854AB81398DB1094EA8DB3350@BYAPR15MB2215.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(136003)(346002)(396003)(376002)(189003)(199004)(2616005)(478600001)(6486002)(54906003)(33656002)(71200400001)(6506007)(53546011)(6916009)(81166006)(4326008)(81156014)(66446008)(5660300002)(7406005)(7416002)(66556008)(66476007)(64756008)(8936002)(76116006)(91956017)(66946007)(316002)(186003)(2906002)(8676002)(36756003)(86362001)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB2215;
 H:BYAPR15MB3029.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jErti10l4i5ZsrfYYM9/ZyKuOAphVPD4H8OCHVg+ePhZ+qTNYdHnbbgOjzNM9JgOFBZPx3m2MxHKCEBuXNyb8sTMHepnSJuElvM8Rg00lJl9JnuQaIle4RSIEMXA4t8mDO5SPifzmkGHWCUSMZEAjw0gGPLrsZwarsr8szGr0AMXItJHkNotQTbVNrlHwIGbZxQO7yaSJtQt48M+SDIYsV3O0CSyUR7d+N6H/jdu+tH/+ZdWPqxgG92jFK9VVLrTYjimFAeSVSJgoOYdn/H4BnY5tJkf/gYJZotftikRZ19TFckR/JgBrPpv0SNp1Y5u4+7bRUjRjrW4boEhBkQ+inPIYQVxm8N1iW4sQACd5vt1yuh+g2KRAY2HT6jMN9RHgDH1yCX6agStzuYdSMDH+humifhbOH7GyWTeFiy4PfzM1yLMZMK9j1q7LpY4aSMP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBC847D4989C734FB55244B44843C7AE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a0304726-4b48-4085-2a9d-08d79869bfa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 20:47:04.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHw0NUkoGMeLObzirpj63/cn4tT1tWAxsL3qXKZ6lxQ7MwCBVPORypJar15TOVVEI7kfvAdCXJ4h5dfnT5i6wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2215
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_06:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130168
X-FB-Internal: deliver
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul
 Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Andi Kleen <ak@linux.intel.com>, Igor Lubashev <ilubashe@akamai.com>,
 James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 "oprofile-list@lists.sf.net" <oprofile-list@lists.sf.net>,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Dec 18, 2019, at 1:28 AM, Alexey Budankov <alexey.budankov@linux.intel=
.com> wrote:
>=20
>=20
> Open access to bpf_trace monitoring for CAP_SYS_PERFMON privileged
> processes. For backward compatibility reasons access to bpf_trace
> monitoring remains open for CAP_SYS_ADMIN privileged processes but
> CAP_SYS_ADMIN usage for secure bpf_trace monitoring is discouraged
> with respect to CAP_SYS_PERFMON capability.
>=20
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
> kernel/trace/bpf_trace.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 44bd08f2443b..bafe21ac6d92 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1272,7 +1272,7 @@ int perf_event_query_prog_array(struct perf_event *=
event, void __user *info)
> 	u32 *ids, prog_cnt, ids_len;
> 	int ret;
>=20
> -	if (!capable(CAP_SYS_ADMIN))
> +	if (!perfmon_capable())
> 		return -EPERM;
> 	if (event->attr.type !=3D PERF_TYPE_TRACEPOINT)
> 		return -EINVAL;

I guess we need to fix this check for kprobe/uprobe created with=20
perf_event_open()...

Thanks,
Song

