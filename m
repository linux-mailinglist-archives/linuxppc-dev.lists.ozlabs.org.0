Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FA139ABA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 21:29:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xQCy2pBgzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:29:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8281b9063c=songliubraving@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=J1yz0yzF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=UejVoVVe; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xQ982v2czDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 07:26:31 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DKOPB7007093; Mon, 13 Jan 2020 12:25:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=YMVBJbGmTCMPeM/KVL6fG5VRMvMQhDHKxQT5748iQoI=;
 b=J1yz0yzFlWbAqfSdSFvN18+X/vkzNVaNVdkMmu90ykfymEeEPIrNIlbCqePr2SiXZT5E
 YBrdfbfJRb9n6AJuCyjsMfYL+ibbtwCnfkPR7D5JxhdLO5whLSrjYiSsabN5zmrHffct
 rbO1BrOAvaq8t14boTTD2cDLQSw4Ku5HhSc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xfcrshsg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Jan 2020 12:25:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Jan 2020 12:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eY87z+fcajIgIiB0WyUvT0oRz5pI9CqN2atf1I+Cge+CBUTSmdqOg0hhTbkoQFZvMpJdwgluFB5nOqeoD8jj/AYp1GoaW/8Xf76/LxcPDrj+8SnYOWc/iAg1glWnmWJ2274pRaFbEVJQlSgxomAhDpAnIveCfe1lYLFJsGWD/cjJA09dUXmlAaWsCEgb2g2aL5Ft2fRIUKNRYV18ng55kirHKoA/OGbYAMdRMRXU54ULlSCK1IGCOvTSFrNGSpu6SFLb0A08gajOgj2yiykPwtzMypUnVI9beW3I22PMCgwTdRacHMoOrmbRHe107tXqFoAIWvxnTKnXsIODU8aT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMVBJbGmTCMPeM/KVL6fG5VRMvMQhDHKxQT5748iQoI=;
 b=nnLDJ4QKQ29/uQ9ryWgIARhJwpyxMF8W8FGJgT+Zhs9rgStRVX86Bg/29UgXzxisDTrFkNIt0sGNNIEA3ej1BAJdGDzjZ2cWkLhM7uBOfX4dpPA5772lPAY/ZzeKOhJT+KPyP02/vQBeAFiqevO3gg9/xnyt9Rb9N9XwIMl4SDMiXnHo9s6xiJ7fvhKjicmwymSvWgIeb3wnrHX/H138c8Q16Eu6rloKvWA5BI1veaRQKXvG3AFDyZ0ot/9TUBXYrMcp8NgM8ME7etn6TDJaf6kze4bTxHFvlpiv+wKRkk6B8KiSFWXlwDfDe4NLTeCc5pgd8qeS8x8Kn0I0ZqKUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMVBJbGmTCMPeM/KVL6fG5VRMvMQhDHKxQT5748iQoI=;
 b=UejVoVVehUKHXOKod/wLceoE+nTaCc2CLL0TwnuEC27LqH/bRd3nJaYN+cQJ65qEEh15Yv20XdTiSnBRWhMdIzFaKw5LMuax/Zbkdd3uCjNFEycv/gleddpLZx1aNyTQA4pGvFJPOzRVU2Q3y1YlUD1kIxUD2oi/L2PuGt3sgAk=
Received: from BYAPR15MB3029.namprd15.prod.outlook.com (20.178.238.208) by
 BYAPR15MB2934.namprd15.prod.outlook.com (20.178.237.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.8; Mon, 13 Jan 2020 20:25:37 +0000
Received: from BYAPR15MB3029.namprd15.prod.outlook.com
 ([fe80::3541:85d8:c4c8:760d]) by BYAPR15MB3029.namprd15.prod.outlook.com
 ([fe80::3541:85d8:c4c8:760d%3]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 20:25:37 +0000
From: Song Liu <songliubraving@fb.com>
To: Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: Re: [PATCH v4 1/9] capabilities: introduce CAP_SYS_PERFMON to kernel
 and user space
Thread-Topic: [PATCH v4 1/9] capabilities: introduce CAP_SYS_PERFMON to kernel
 and user space
Thread-Index: AQHVtYUIRY0pFUyTckCQImxjUxqfyafpNC8A
Date: Mon, 13 Jan 2020 20:25:37 +0000
Message-ID: <7EBC6A81-1DA7-4D5C-972F-4D5987B12E2A@fb.com>
References: <c0460c78-b1a6-b5f7-7119-d97e5998f308@linux.intel.com>
 <e0cb2b8d-e964-bc23-bf80-58d7ac4ed6f1@linux.intel.com>
In-Reply-To: <e0cb2b8d-e964-bc23-bf80-58d7ac4ed6f1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-originating-ip: [2620:10d:c090:200::6df5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03276049-59e7-43f8-60f6-08d79866c03b
x-ms-traffictypediagnostic: BYAPR15MB2934:
x-microsoft-antispam-prvs: <BYAPR15MB2934A2DFF73E81C06F0FB5B1B3350@BYAPR15MB2934.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(54906003)(186003)(6916009)(5660300002)(6486002)(36756003)(316002)(53546011)(2906002)(6506007)(6512007)(2616005)(478600001)(8676002)(81156014)(966005)(33656002)(7406005)(7416002)(81166006)(4326008)(8936002)(64756008)(86362001)(66476007)(66946007)(66556008)(91956017)(76116006)(66446008)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB2934;
 H:BYAPR15MB3029.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93Hm0kDIkITp9ifXxQSnvwqQi/nLTYmv/XQNEvA6iByhmIC42RXbg9GFaRPap1DkmFm2TMjtF+vJQOUc4A15pzLxa/GH7pz2GPIK9k8KFY/eNEh9unpL2aZiK4IohZ0+7or6EhGqWCoN+75t+C9WT10MAjC/5WBt6nT+q+ZZwqcwQ2tyAbBU2aYJDsGpVmRvxJzYisedobb29zt8tu4M2s4FBSVMyC/xirbpxFlFa/dFADwzedAT6mkLIYlzu25g4kAv0Qj/fXBoo0Qv/kN/za3gww/XW1pnjbeX+u4WPiOj9JSsTRg6yqK2TOgAeK0E1mmk6SnkI3s5qXyeQATEChR9u03k8YzDkh45sMx7uwkDKMDQrc8kqUznD3Y8P7xQTJPmPJzALHjUJ733EUJgs+mtnqV+Vq3JJ2H3X7LNdFaFtQ4zFdqpwsUfF0O5Yh4nHZDhDiDLas+WXl/VPIxByL/APdBJmRnsub2jZZvrTdl1sTt9EJcMYUfhPlMBuObiSzRMFIm4v+mSauhJGPx8cA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05A2858D29365040812017508B06EED0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 03276049-59e7-43f8-60f6-08d79866c03b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 20:25:37.1870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+VmdSsiQuGj0Q9kUsqQcqOgDEsWz97kXDupKj5HtKvzd7cAP55W7Hv5QSr4PnYK5XDcJnsTFBFGVigD0kGpHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2934
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_06:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 mlxlogscore=764 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001130166
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



> On Dec 18, 2019, at 1:24 AM, Alexey Budankov <alexey.budankov@linux.intel=
.com> wrote:
>=20
>=20
> Introduce CAP_SYS_PERFMON capability devoted to secure system performance
> monitoring and observability operations so that CAP_SYS_PERFMON would
> assist CAP_SYS_ADMIN capability in its governing role for perf_events,
> i915_perf and other subsystems of the kernel.
>=20
> CAP_SYS_PERFMON intends to harden system security and integrity during
> system performance monitoring and observability operations by decreasing
> attack surface that is available to CAP_SYS_ADMIN privileged processes.
>=20
> CAP_SYS_PERFMON intends to take over CAP_SYS_ADMIN credentials related
> to system performance monitoring and observability operations and balance
> amount of CAP_SYS_ADMIN credentials in accordance with the recommendation=
s
> provided in the man page for CAP_SYS_ADMIN [1]: "Note: this capability
> is overloaded; see Notes to kernel developers, below."
>=20
> [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__man7.org_linux_=
man-2Dpages_man7_capabilities.7.html&d=3DDwICaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&=
r=3DdR8692q0_uaizy0jkrBJQM5k2hfm4CiFxYT8KaysFrg&m=3DL5qCuMRrTvYhyjR1rpgE9vE=
v4HppVlOXDIzKzoGL30c&s=3DFNJpET4buKFRuqktVHQphaY1qE7IsdFpU4iYwpCn4tY&e=3D=20
>=20
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Acked-by: Song Liu <songliubraving@fb.com>=
