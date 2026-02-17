Return-Path: <linuxppc-dev+bounces-16917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDTgENbVlGnnIAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:55:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105E1508B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFsNy5GMbz2yFb;
	Wed, 18 Feb 2026 07:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.144.234 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771361746;
	cv=pass; b=hEXWTPHq6fq/u65hrl0qg7HOuH5p/kSyHJjIYEppEBGGeGckcrLW7DTpIlBMTz7+TmD7anDvvlmgg+h4GYefYRBYw+srou399DkCavKRZWqeL23UjleydjYaB1QWV/ppDqxksqJWVcrqnRWYb53k0j+azASeSCBSso3V+EfACdtGSn/luUd8hvNQTSnQdciC9A1UEIY767v3ReGLIbyyRJ136ux9UD2ettQhKhLCN2ZDLsZxhcTpjO23oZHksEOsV5Z5U345iHIoxTPD+mxz99i+BuT+M63+UQE9eT59MtYlxC0T7irrdHL0uy9z5H8FngHtDOasn2oZeTayGj/zgA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771361746; c=relaxed/relaxed;
	bh=EeBm2ZsiYkXEVeP/UNVwezy+gHyBnxHwi9Mwz9JBb80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W7np0WUwyVbrz9a2S3LnDHZrpQNopQsAwlbx1WP5BVd85FQoNpL37Pr1a1v7SESceeZppb9W2W9ll6MHlWLKRtE4j0M75zuZiAPFvPTbTy84YnAFQFN9+vWeB5CgwRAZh2mFfBg/h4+kfEGm1fNHd3TKvIa+U4G9r6Vs2IgItTl50Lkwh/pulU6042RVpXW4lPd+x0SU2Nr9XklGMBsjHU/m24p88RxhFpdk/oGL2Kooa1fe0VWHEEcwOXRM74y8db0NnWVBEI6j9zemWvT9Xiddh7qKCUv64fBUSUpQe8zsU3Wx9W/lZYhXRllq5LBWzyDySMkzm0fzd1k+WnBcmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com; dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=MTjd5i74; dkim-atps=neutral; spf=pass (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=7508c0b572=mnassiri@ciena.com; receiver=lists.ozlabs.org) smtp.mailfrom=ciena.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=MTjd5i74;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ciena.com (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=7508c0b572=mnassiri@ciena.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 459 seconds by postgrey-1.37 at boromir; Wed, 18 Feb 2026 07:55:44 AEDT
Received: from mx0a-00103a01.pphosted.com (mx0a-00103a01.pphosted.com [67.231.144.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFsNw63PZz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 07:55:43 +1100 (AEDT)
Received: from pps.filterd (m0174892.ppops.net [127.0.0.1])
	by mx0a-00103a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HJXw3O3273732;
	Tue, 17 Feb 2026 15:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=06252019; bh=E
	eBm2ZsiYkXEVeP/UNVwezy+gHyBnxHwi9Mwz9JBb80=; b=MTjd5i745eUFV0la/
	5p+1onKa0YpIK9jSIGAB2Pc7F8HCHnQcLbFzPm2c/iJIHq0jtSNEEYtC1Nk095/U
	haC9yUipi/QdRP3W3X0ZtsFc5+VTkeSu1UG3imEQ9uuXKhknNuHliBm5kwj6TsTu
	JjgnU5x4FxKNaYwWSbjaKNoqG4GN7eSQHNhCG0PpgjuIXp+QBvcaCXTp1CyFVUAO
	tfgtASjv+mcAbQCVMVtmDl6cDXAAiZgUM43dz7eolGPZDOC3YmWnlXWcdQ2R3qTm
	OoYCz+jlJL/1eVrUYPdGr7/BjURxAlC9UuizXWjP4W7KuLnV30QCZyxu62GmQqRt
	RfdrQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 4ccq121tyn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 15:47:48 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9cl3al4tl87/wuD1QdYT6ageOSr4+DZkuv02KxY500eHQ0SjkrvMXaklV2F6SY8ZoDLFDBx/GHcPjuf6AkaFZVUuI03+0fN0IFDhazpKBRMG65afYHkPHxHfcTxUJJa/rvsFa6iSG12tEm4Z5WJE87DKcgiAzx/nYau8Xowu7pjCyiPn0CxLHYkZMoW52m0vHctFeEjvSxK5oLdasPPEJIUcx6REPWdBPNDVyY1CX9ulmnoOuBzIHCvkb60iGytozYh7PyBu1K4Hift+7ay1/lX4mwhqO2yVZmx84UgQupB8S2vmIYCy4zzGG5uTXbt1z7SUrZl0ap7hh/50N6gHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeBm2ZsiYkXEVeP/UNVwezy+gHyBnxHwi9Mwz9JBb80=;
 b=Wy2fUxpvoTFamZf4+YHiKZejPDxo84puvMWe5rh0xA+ejf+V0LNKrAsju8aPVmUUhBvRqEnpMcZ1IbccoLDMD7hNjkn8LpXMAu0OieKmylrCXnRkqHH/HGXV8g7k/NH9h8/ESnFDn5vaf8iAHC6FM0vIt+LYHda7o1TH/CLWWPLaXCoNkmfZdTmx0fZoDQneFlQJTw9mDp5qaLpf5qMmA0TuBfl0iXDfzPFYZesT8Gj2nwMrxe5BMn8tVfdtGVaLrV0QI6ITTO5XnRylvmUtlTFizs46W0jAJyjIpDn1UF0nDxDAPFugHgfzPhIBPXy2XnOh6z1wCkm3M8qKbNAJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from CH2PR04MB6821.namprd04.prod.outlook.com (2603:10b6:610:94::20)
 by PH7PR04MB8998.namprd04.prod.outlook.com (2603:10b6:510:2ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 20:47:44 +0000
Received: from CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103]) by CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 20:47:44 +0000
From: "Nassiri, Mohammad" <mnassiri@ciena.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Topic: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Index: AQHcoEcGeCnVUQeYJUiohhPZh5dZMLWHVfAAgAAFLco=
Date: Tue, 17 Feb 2026 20:47:44 +0000
Message-ID:
 <CH2PR04MB6821FE3DB2DFB9417DBD8775C56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
References:
 <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
 <20260217152316.78d2dca8@gandalf.local.home>
In-Reply-To: <20260217152316.78d2dca8@gandalf.local.home>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR04MB6821:EE_|PH7PR04MB8998:EE_
x-ms-office365-filtering-correlation-id: ae1ab532-c7b9-4145-21f3-08de6e65ccf1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?alJ2dmhuZmxzRlo0YlVzVWN3aEFiMjBic1dlZ3hDVmJRUkpLRFFxdjJES3Ar?=
 =?utf-8?B?cGtBMVc4cjVlK0wvNGtVeHBsSjY2aHVCaXRHTjhBQkpMa2xCQnEvRnN4bytJ?=
 =?utf-8?B?SnNLQlRjTUt5S014RGU2WHhuOGV5bnlsWitjNk0wSXFPYzlWOEt5TnZaZGtm?=
 =?utf-8?B?WEFHWnZwNnhFeGlTdEVTZ0xVZy9rUnNJQVZvU3pzTlZFUlI4cS9Fb3NlRFN3?=
 =?utf-8?B?Y1ZJcEpDb2xQQ0NSRDk2NjEwTm1DMG9pSnAyS0FmaUpXVnlCdGVIL1VzNnVo?=
 =?utf-8?B?WGhvWWdFUnVmYVBXY2JWMnlrYVQwd09BbTBMU3E2VmJPZE8wc1BocnVacWNR?=
 =?utf-8?B?TFlOdzQrQ2owcEcyT2N4WXQvNk4xbjZuUjNkdkNDaVE0MXFVa0NGZ2czOC8x?=
 =?utf-8?B?dnVTbGpMQlMraVp3em9vd21zOGRQSlJyRlYwQjBLaDlYNDBtUmhJUVpXSk8y?=
 =?utf-8?B?MEZMOTd3VFV3cnpLQllUWmZUSTdEcnlmZUdVb240cnlHQjBuWlJqQVZkbzkr?=
 =?utf-8?B?d016VE1HRGkwK3g0UjBHRXNvb0FWUFAvZG4wOG1sM3dobEJudzdKSk95c0RU?=
 =?utf-8?B?YUNYZ2l4czYzM0lSaTNLdHhOMFJlNEw3WFcxbE53c3Z4VXpBa29yOWl0Sk5J?=
 =?utf-8?B?dys3MTRCRExNTEwwcThLYzJmck9ueGR5Z2Y5UnNZaUhsemxxNDVtZGRyWkJK?=
 =?utf-8?B?KzlGSFVCL1ltOG9YM1pONkRjS2NzMHRKeHJKSGErWTBwK3htVkVkdGRLbEQr?=
 =?utf-8?B?Qm1zQU55MHBjbXJZWDMwYis4WmZmdmR3a0NxWTNnek15eDdENnZYVW91SENB?=
 =?utf-8?B?VGFLK21pWXpnWjhsMzlHQWhyNVBPbWQ4UjZqeVVlZFJZZU9mOVc3d1o0eDEy?=
 =?utf-8?B?ZnA1RjJsbEV2NFh1eldpZ2Q1Uk1hR3hTZllNWDFiY2ZxRkszNFpIN3kxQm9H?=
 =?utf-8?B?aGJldVVaemNZdEVsU1RFbGpuR09OazV1Q3FCTmdTdXAvb1FHUmE4Q1Q3SWV1?=
 =?utf-8?B?Yit1ckRMMTFwYlRZTVlHWHhkcVBGRksrWmtJYzJOVXc4U2VWZ1NJbmhJWDBJ?=
 =?utf-8?B?NEVRWTZ3ckxRRGJHUDNOR3kyMU1TT0hVRGs0V2hGVzJOangwb216eERYKzBx?=
 =?utf-8?B?TnpKUktOZ1ZEdEdNVHVaUUZEZE52L3dPUHBqeDdPRWM1eDBjYkNUM1lLQU4r?=
 =?utf-8?B?MDJXWDdvTVVDMFcwbkRsNlZ0ZE45OURnc0FJV083SHg5WTM4MlIrRk9qZHZ3?=
 =?utf-8?B?eU0yMmZNWTJ2SVo4MVlJR3Z5VUNPVHRCeWNmczBnaVJrY3IwM041MWVaTkRQ?=
 =?utf-8?B?SzhEeGt1eGd3NkVab3Z4VjhnT0JTbTdmazZ3UnJMWnBmZVdhZHVkOG1SbVVB?=
 =?utf-8?B?Y1NyZzY2VEp1dlBoZ3JnOWtPcG5vdUtNajhuU0hOTTJHcHo5enhSRGZHa3R0?=
 =?utf-8?B?WVk0aHAybGJGVFAyMlJUYlFEeEJucmVYbHREOGVMQzgxNWdIQnlnV25MdG8w?=
 =?utf-8?B?VVBhOGhDYlpRU1hhenRlcmhqZ3lObmx6M21laFdnZHVxeEEzWFRzWnQ0cTgy?=
 =?utf-8?B?cjl4b2lXZE1ZYVJyLzQxUEhUMVJKeVV1S0Z4WkQ1ellUWXgvakVhNGhqZnln?=
 =?utf-8?B?Z2xGTjEvRHNUNVZUTkJ6MUlYWnZpRFlMeFFIMFUvUFh2Z0F6b29RaGtpZ0Qw?=
 =?utf-8?B?eVl4NU9iMVJXREUyZ2hWeE1SakZjOFdOR3Qza25uTndERW1vVURDZmp4czR3?=
 =?utf-8?B?dU16QlJBUUZ4MTUxZWZZd3hhbk50K0NXRmdtMXNacjNXSi9Ob2V6THVMRHJO?=
 =?utf-8?B?NVF5T2hSY1BrUUpTZ3gyNG0wS25rSS8vZm9FN2krQ2pKaktlbkplNVBaakhw?=
 =?utf-8?B?eHdVSm9HMnVmYmRIRzM5TnBlYlZKajNtSjJOdTdrS0s3eGNob0dSMVZtZjgv?=
 =?utf-8?B?R2lPMHJKdHFZenlEWXh2anpZTzIySTFIS2pmMmZVYnpxU3JIbWdieHNGWXEx?=
 =?utf-8?B?OFRYWnpMcU85c0hRL3lpZEhSRXlLbXFOYW9vL3FreFFCYTNnVG5DcjRWeEVS?=
 =?utf-8?B?cDN4TE1RRkRXd0YrNmd3Y1RFZ0VXUExpSFd5a3N4WjNkUEhCY0Y0QUgvdnlQ?=
 =?utf-8?B?K3l5aFdUeVNJbHpRMW5sSS9IbUhkSW1BYjdZMEhEYlFnQjltblU3QjFtRk9K?=
 =?utf-8?Q?+ONs5yMuEsauwKj0z9o/Ero=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6821.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1BMSlZxb2JYbURGM1FDSmo4LzVyM095UGhyMzJabFA4TGRGVStjRWtHLzQw?=
 =?utf-8?B?YU9MK1FKZ0FINVorZmQvRU5HTy8xS1JiQUVYeG4xZmlCazB3UDdWQmxZRDRG?=
 =?utf-8?B?Q2ZBTVV0RmxNYVU4dTM2c2gzaTFkbmtVVlowYVhRYWFnanFHdXJxcm1sWWxU?=
 =?utf-8?B?TjJlRTdpRzE3YzRadUlFLzBDYnVJYmxzZFV0eVpXTStWa3hPdFdyOGQxMHpP?=
 =?utf-8?B?QWt3enZVZG8xMmJ5TG5iTVMrRzZjWUtRL1BpVS8xdjFiRFFxcXNOdlNudU44?=
 =?utf-8?B?WTUyTnNLU0Uva3QxVENVNHJMai8vR3J5a056MTYvN245RmRYcG1qT3lWRkd1?=
 =?utf-8?B?c0JHNlRIL29Va0R6RjlTbUlFUzNnVjR4VGd5OEtwMmwyeTlnaFcwMXAzcFI0?=
 =?utf-8?B?SUx4bHp2blhlQ3l5RXlONm8xUzIvRkorTkFhbDQ0bXBWbGVQUlVBNlY0RFh2?=
 =?utf-8?B?djF3MXgxWmI2TThWUlBOZlNGdG9vS05qVnVxblhFZEJxOVhEUXFRV1htMmJ0?=
 =?utf-8?B?QnV3bU9ZTmRlSlF3eFA1V1psMVRjdXp0YjU5dUZZOHNQTFlUd1h4cU1rQjd1?=
 =?utf-8?B?TXVWMm5lbDA0NG5nanJ2cUNQbi9ST0QvTUdHSXRkbE1iK3QzZU5senoxRm14?=
 =?utf-8?B?eTlKKy9rWm1XZDB4aEY2SUc1dGlHZ2k3WGdRaGZCQWdadHNrdWNRNndYRm9t?=
 =?utf-8?B?aERJb2tRMjV0bFhLM2VSUi82dCtSZ2taQ215WmZPNStKQ0tEZFAydWVQTEo2?=
 =?utf-8?B?TkdIMmFNN1JOQ1drb25NSjRwQVJUdlhCa3lqREZjajdCL3RLQThoaURoNVlU?=
 =?utf-8?B?UEIzN3NvMjJXZTVnanhXQXNGTGRvM29uRlFBcUQyRlFEZHlxMTRxZ211emNl?=
 =?utf-8?B?Qzd0cmcxQlRKS2QycmZmclVTaXJjRkxSa1NIMW5ZVkN0bnJFdFo0Y3I5bXFZ?=
 =?utf-8?B?ZkJZVkcrS3d5WVFFQUdFSk53Y3VZMzVic3FMdmNKZDAxTjVmNlJuTjBpSFJ3?=
 =?utf-8?B?OGxOVDF5eWlsRmc1d3VLWVRCdTFBSGlHUnNNMm1KMFhyVXJKUlBTcmRTMDZL?=
 =?utf-8?B?QzMyUExncllJR1hLaERsN0FMaUVPVkdqL3Q3WG4yallUdy9kalR5T3V1eEgv?=
 =?utf-8?B?ck5mcnBnUmtuR0FpMzVnckhyeldlL1AwczNwdTF2cDZBaHdlTVNrbE0wTTVi?=
 =?utf-8?B?a3V3NTN5TmVBbnBsdzRpbEUvSlA5NFgxU3JXNm14NHR4MUY3SDlWODc3Wnda?=
 =?utf-8?B?Yk1uWFdDYjgyMGJWSzQ3VllUdEVqWUhYWEhwZWlZbmpaZ1NmNFNxYitGVUtx?=
 =?utf-8?B?MG9tNjZZNVpKZEI4UU9XNVFTKzJSa0kyYnlNRzVPMUlWeXliVlZ2dVdGMzlH?=
 =?utf-8?B?MHd0Z21Pdk1xaUlXZ2l2a1JrQmJlbExURHFNYWlLQjZPd09KOG1KRk4rYzJF?=
 =?utf-8?B?YWJFQ0RnWVJObE14ZnVIa0IwM0gxSG5ZSHdJMFRrL2JkZlFTZ2NHZVJFdlJ6?=
 =?utf-8?B?VmVNc1ZOQ05QRVE1VjVlcHd5emZyU0VtaS95WFcyc01lcldGNDFGZy9rN3Vw?=
 =?utf-8?B?S0RiL3JSazNFMTY0UkFmUlowdU1FdWRSajdSTUptbEc5YjhRUnRpdllXbnJh?=
 =?utf-8?B?VCt2WC9zNDRTdGpFdmkxSUNlc1l2Y2ZuVkpkS1ZPK0RKbGRsM3RyOUhpYzRE?=
 =?utf-8?B?YU5ld1RhN2UwQzV5a2U3WGNnb0FkaFFsUitoQ1hscXk1RkEvNEFrWVBoREIz?=
 =?utf-8?B?amEzUjVxODVGWFo0cVlsQWFnWmpUcmY3KzRMY2ovdjRYV3pvYnNxSnVFNEFh?=
 =?utf-8?B?bUhpSnN4UXZ6VUNJYTc1LzdYMDJ1YXdXUVpXUFJNU3dzTmNJbk9pcERPWXdw?=
 =?utf-8?B?bkhydU03bXA1L0tFSUoxYnI5UVFYNGhFRmNsNFZvUWp4R2pWeTF5OWluU3pl?=
 =?utf-8?B?SkRSbGNUMVdkd2p0S0dEeHJLNHdtbE9GSUwzRXEwbWJjNXg0VU5POGNZTmNS?=
 =?utf-8?B?UXc5RWtFWUV1eWhKaWJMK29xS1lPdlZNZXRpN3VOd3ZWY1cwWnV1dm94bUZX?=
 =?utf-8?B?RTllemUyeWx1SXdzOUtCTngrWWJXTTBSdWZuS3k1TTZ6cGFkb01iVno3LzBk?=
 =?utf-8?B?QXpVUENTcGdSWWZUekx1ZUhpY1BBUW9Tb1ZmcGhmc3RZOHM5VEc3RklzeTg3?=
 =?utf-8?B?UnlKQUVlaDlSRWE3VlJseFNSS0JnNnlIMlJMU2trR1R2c0QvRkEvMVl1RCs5?=
 =?utf-8?B?R0lKOUVXeHNSa3RheE5ENzlUcmdhb2c1U1NHL2FaZVVkTE85NVMvdW5aMFdz?=
 =?utf-8?Q?do1VTQ+YNM5IxjtmB7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1ab532-c7b9-4145-21f3-08de6e65ccf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 20:47:44.2014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FYVQmW6C+HU9qUoGDU5olWbszY3ORQpVb6HPQ+JtqDjLC2OWASdhfckx8Z6x0nZeVIvxnarQYRitG4pUIYbuqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR04MB8998
X-Authority-Analysis: v=2.4 cv=da6NHHXe c=1 sm=1 tr=0 ts=6994d3f4 cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=meVymXHHAAAA:8 a=FmoMKUsJAAAA:8 a=voM4FWlXAAAA:8
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=1UX6Do5GAAAA:8
 a=pGLkceISAAAA:8 a=ZRhfn8k0XnYb0PUkbesA:9 a=QEXdDO2ut3YA:10
 a=2JgSa4NbpEOStq-L5dxp:22 a=IC2XNlieTeVoXbcui8wp:22 a=cvBusfyB2V15izCimMoJ:22
 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-ORIG-GUID: loiTe7PI9h4oRMk82miqUhmYUbUAhxeM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3MCBTYWx0ZWRfX+pS8faSvJEit
 YslEjp1KdTVV0hUk5Bn4sBYXtsvqmRK5RjD3qCMAqIOCvCApJcypE30tsl1rQoDimS3TkGSpkS8
 rWNNvin+4le1W2c6vvrEZjjOEQAitKN1e86K1xU36Qp6ycF1lzd6MBKJ93/y5Yjy0lIMN+vUzs8
 mT6vfdoM8LlQ480wLweNxBNRuLa75ho/32pmNUQTYoPT1qOY9/IKGKToz2C+/BChAwcto9oxMny
 lYsE7omfP5edzbqLjsfBsgSNYs57VWUXahMpjr0734JYH3WN+xxqxEwDvgSazDfaUIm/K2g8WDy
 xIkI1c9MG2QZUHAOBKCkeL1gL7rWOpsCTah2dckdGDSCG/dP3Q28kTAjx+aVJASZI1/uBMf73Co
 uwiKjAwOSqNlY7ZlJowzzF5I0ueEp7BayU1MGtwo6MDPnp0OpY1RCfQOKajNSHLM/OdZXo+Fcsk
 5MF+lx2qV7lbiJwubrQ==
X-Proofpoint-GUID: loiTe7PI9h4oRMk82miqUhmYUbUAhxeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ciena.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ciena.com:s=06252019];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16917-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,ellerman.id.au,linaro.org,csgroup.eu,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ciena.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,ellerman.id.au:email,linaro.org:email,csgroup.eu:email,ciena.com:email,ciena.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4105E1508B3
X-Rspamd-Action: no action

SGkgU3RldmUsCgpUaGFua3MgZm9yIHRoZSBxdWljayByZXNwb25zZS4KCldlIG1heSBwbGFuIHRv
IHVwZ3JhZGUgdGhlIFBQQyBidWlsZCBlbnZpcm9ubWVudCB0byBhIG5ld2VyIGtlcm5lbCBpbiBh
IGNvdXBsZSBvZiBtb250aHMsIGJ1dCBub3QgYXQgdGhlIG1vbWVudCDigJQgaXQgaXMgY3VycmVu
dGx5IHRpZWQgdG8gTGludXggNS4xMC54IGFuZCB1cGdyYWRpbmcgd291bGQgcmVxdWlyZSBzb21l
IGVmZm9ydC4KCkhvd2V2ZXIsIHRoZSBjaGFuZ2UgYnkgTWljaGFlbCBFbGxlcm1hbiBpbiA2LjEg
aW50cm9kdWNlcyBDT05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSIGZvciBQb3dlclBDLCBi
dXQgbXkgZXhwZWN0YXRpb24gd2FzIHRoYXQgcGVy4oCRc3lzY2FsbCB0cmFjZSBldmVudHMgd291
bGQgc3RpbGwgYmUgYWNjZXNzaWJsZSBpbiBlYXJsaWVyIGtlcm5lbHMuCgpBcmUgeW91IG9yIE1p
Y2hhZWwgYXdhcmUgb2Ygc3VjaCBpc3N1ZSBvbiBQUEMgaW4ga2VybmVsIHZlcnNpb25zIGJldHdl
ZW4gNC4xNyAod2hlbiB0aGUgc3lzY2FsbHMgd3JhcHBlciBvcHRpb24gd2FzIGZpcnN0IGFkZGVk
IHRvIHRoZSBMaW51eCBrZXJuZWwpIGFuZCA2LjEgKHdoZW4gaXQgd2FzIGFkZGVkIHRvIFBQQyk/
IEZZSSwgb24gbXkgc2lkZSB0aGlzIHdhcyB3b3JraW5nIHByb3Blcmx5IGluIGFuIGVhcmxpZXIg
a2VybmVsIHZlcnNpb24gNC45LnguCgotLS0KTW9oYW1tYWQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KRnJvbTrCoFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0QGdvb2Rt
aXMub3JnPgpTZW50OsKgRmVicnVhcnkgMTcsIDIwMjYgMzoyMyBQTQpUbzrCoE5hc3NpcmksIE1v
aGFtbWFkIDxtbmFzc2lyaUBjaWVuYS5jb20+CkNjOsKgbGludXhwcGMtZGV2QGxpc3RzLm96bGFi
cy5vcmcgPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPjsgbGludXgtdHJhY2UtdXNlcnNA
dmdlci5rZXJuZWwub3JnIDxsaW51eC10cmFjZS11c2Vyc0B2Z2VyLmtlcm5lbC5vcmc+OyBtaWNo
YWVsQGVsbGVybWFuLmlkLmF1IDxtaWNoYWVsQGVsbGVybWFuLmlkLmF1Pjsgc3Jvc3RlZHRAcmVk
aGF0LmNvbSA8c3Jvc3RlZHRAcmVkaGF0LmNvbT47IG1hc2FtaS5oaXJhbWF0c3VAbGluYXJvLm9y
ZyA8bWFzYW1pLmhpcmFtYXRzdUBsaW5hcm8ub3JnPjsgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PjsgTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNv
bT4KU3ViamVjdDrCoFsqKkVYVEVSTkFMKipdIFJlOiBbUFBDXVtUcmFjaW5nXSBNaXNzaW5nIHN5
c2NhbGxzOiogZnRyYWNlL3BlcmYgZXZlbnRzIG9uIFBvd2VyUEMgdnMgeDg2CsKgCk9uIFR1ZSwg
MTcgRmViIDIwMjYgMjA6MTA6MzkgKzAwMDAKIk5hc3NpcmksIE1vaGFtbWFkIiA8bW5hc3NpcmlA
Y2llbmEuY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBPbiBQUEM2NCB3aXRoIFlvY3RvIEtpcmtz
dG9uZSBhbmQgTGludXggNS4xMC54LAoKNS4xMCBpcyBhbmNpZW50IGFuZCBub2JvZHkgd29ya2lu
ZyB1cHN0cmVhbSBpcyBnb2luZyB0byBib3RoZXIgbG9va2luZyBhdAp0aGlzLgoKSWYgaXQgd29y
a3Mgb24gYSBtb3JlIHJlY2VudCBrZXJuZWwsIHRoZW4gbWF5YmUgc29tZXRoaW5nIG5lZWRzIHRv
IGJlCmJhY2twb3J0ZWQuCgotLSBTdGV2ZQ==

