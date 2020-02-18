Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B02162E6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 19:23:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MTkM73q9zDqdS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 05:23:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.27.197;
 helo=updc19pa22.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=fGrpSytJ; 
 dkim-atps=neutral
Received: from UPDC19PA22.eemsg.mail.mil (UPDC19PA22.eemsg.mail.mil
 [214.24.27.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MThR4nQJzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 05:21:39 +1100 (AEDT)
X-EEMSG-check-017: 59597405|UPDC19PA22_ESA_OUT04.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,456,1574121600"; d="scan'208";a="59597405"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by UPDC19PA22.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 18 Feb 2020 18:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1582050090; x=1613586090;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=t056j3xez4XxxDTksbJVc3+OMTywu4PBL8Ajb4e16gA=;
 b=fGrpSytJjBS+dyR5iSq9e06b5RLQtJzeuVMMDnLz3o8w9uwMGBgzvrpn
 +UwVrdYnoacSZwA1PHRqfqYWQYujSweR5QT7sviqo5tyyPlIyn+8CIZHZ
 2aZYtxBd7cJngiM94wBjNYmE/xsO5IW5ytMW5/+S3KLrsxt1CZNhOETxp
 +EkhcIWvXVwNVxnJkw2VutDrexECH9+P4KqxaSDJj/a1EsMEpX/8FLy6N
 sYCYUlwKMPNE0jroXIFZ7G9t6MIXYZWlNkcd6zY33/UwR2qzua9rGqdMb
 5hn914LT0cRRRFvF7N498wmSWhTx+BNy+Hbuw7adBGo1aUF+jVDrfrGLw A==;
X-IronPort-AV: E=Sophos;i="5.70,456,1574121600"; d="scan'208";a="33169528"
IronPort-PHdr: =?us-ascii?q?9a23=3AguxcAB11borM6JmdsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZsegeLv3xwZ3uMQTl6Ol3ixeRBMOHsq4C1Lqd6vm5EUU7or+/81k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba59IRmsrwjctcYajZZ/Jqos1x?=
 =?us-ascii?q?DEvmZGd+NKyGxnIl6egwzy7dqq8p559CRQtfMh98peXqj/Yq81U79WAik4Pm?=
 =?us-ascii?q?4s/MHkugXNQgWJ5nsHT2UZiQFIDBTf7BH7RZj+rC33vfdg1SaAPM32Sbc0WS?=
 =?us-ascii?q?m+76puVRTlhjsLOyI//WrKkcF7kr5Vrwy9qBx+247UYZ+aNPxifqPGYNgWQX?=
 =?us-ascii?q?NNUttNWyBdB4+xaYUAD/AFPe1FsYfzoVUApga6CQW1Gu/izjpEi3nr1qM4zu?=
 =?us-ascii?q?shCxnL0hE+EdIAsHrar9v7O6kdXu+30KbGwi7Ob+9U1Drn9ITEbh4srPOKUL?=
 =?us-ascii?q?ltccTR004vFwbdg1uNtYzqISuV1uQTvGid8uFuSOevhHQjqwF1vDeuxtonh4?=
 =?us-ascii?q?7Sho0I0VDJ7jl5wYYpKt24T053e9ikEIBKuC2AOIt2Rd0iTnhutS0nxLMGvp?=
 =?us-ascii?q?u7czILyJQh3xPfbuaIc46K7x75U+aROzh4iGpmeL2hnRay91avyunmWsmzyl?=
 =?us-ascii?q?ZKoSxImcTPuHAVzxHf98eKR/Rn8kqhxDqDzR7f5+5aLUwuiKbWLYMqzKQqmZ?=
 =?us-ascii?q?oJq0vDGzf7mEDxjKCLaEop4vOo6+H7YrX+oZ+cKpN0hhn+Mqswnsy/Bvw1Mh?=
 =?us-ascii?q?QUUGiB+OS8yabj8Vf4QLVMgP02lbLZv47GKsgBuq64AxNa0oYk6xqlCTepzM?=
 =?us-ascii?q?8YkmUdIFJAeRKHi5DlO1DIIP/mEfeym0mgnThkyvzcPrDtH4/BImbMnbv/Z7?=
 =?us-ascii?q?px9lZQyA8pwtBe45JUBKsBIPX2WkLpr9zXEwQ5Pheow+fnFNp91oQeVXiJAq?=
 =?us-ascii?q?+CKqzeq1CI5uUxI+WUfo8apC79K+Q55/7plXI2g1sdcrem3JQJaHG0BO9pI1?=
 =?us-ascii?q?iEbnX2hNcBEmAKvhQlQezuiV2CVyNTZnmoU6I94DE7FJypDYPZSo+xh7yB2T?=
 =?us-ascii?q?+xHodKaWBeFlCMDXDoep2GW/cJbyKSONVhkj0fVbW6TY8uzxSuuxH7y7Z9Ke?=
 =?us-ascii?q?rU4CIYv4r51Ndp/+3TiQ0y9TtsAsSGzW6NVW50kX0TSj82xq9/pUh9y1eF0a?=
 =?us-ascii?q?Rin/NYEtlT7etTUggmLZ7c0/B6C9fqVwLZYNiJVEipQs+nADwqT9IxxdEOY1?=
 =?us-ascii?q?xnFNq/kB/MxTelD6USl7yRC5w+6rjc0GTpJ8Zh13bG07EsgEM6TctKK2Krna?=
 =?us-ascii?q?1/+BbJB47PjUqZk7ymdaMG3C7C7G2D13aBvFlEUA5sVqXIRXUfZkrQrdT24U?=
 =?us-ascii?q?PPVLyuBqo9MgtH18GCLrFGatrzjVVJXP3jIsjRY3qtm2esAhaF3rGMbI3te2?=
 =?us-ascii?q?UbxirdE1IIkwQJ8naGKQg+ByGhrHzYDDF1EVLvYkXs8fRxqX+hT080yR2KYF?=
 =?us-ascii?q?Nl17av5hEVgvmcQesJ3r0YoCchtyl0HFGl0t3MENqAuxFsfKZCbtMn5ldIy2?=
 =?us-ascii?q?bZuxZ6Ppy6IKBonkQefBhvv0PyyxV3DZ1NkMYrrHMuyAp/MqGY301bdzOew5?=
 =?us-ascii?q?/wPqfbKm7o/BCgc6TWwE3R0M6K+qcT7/Q1s03jsxu0Fkom7nVnyMJY02CG6Z?=
 =?us-ascii?q?XPFwUdS4j9UkEt9xh1v7vaeDUy55vI1X1wNqm5qiLN1MwtBOsh1BmgZcxSMK?=
 =?us-ascii?q?yBFA79CcEVGtahIvQwm1e1dhIEIPxS9KksMsO6ePuG3KGqMf1knDKni2RH/Z?=
 =?us-ascii?q?x90liL9yp6S+7J0IwJzOyG0QGfTTfzkE+hstzrmYBDfTwdBGm/xDPgBI5QYK?=
 =?us-ascii?q?1yYIkKBX2vI82x2tVxmZrtV2RE+16kAlMMwNWpdgaKb1zhwQ1Q0lwarmK9mS?=
 =?us-ascii?q?SiyTx0kismrqyE0SzBxOTicxUHOmpVS2V4kVjsJo20hcgAXEe0dwgpiAel5U?=
 =?us-ascii?q?HiyqhaoKR/MnLcTl1Tfyj2MW5vSbG/trmYbM5K8pwosD9bX/i7YVCfUrT9uQ?=
 =?us-ascii?q?cV0zv/H2tCwzA2bzOqupL9nxxhkm2QN2xzo2TEdsFw3xjf+MbQSuJW3joDXC?=
 =?us-ascii?q?N4kyXYBkCgP9m1+tWZj5PDsuG4V2K8WZxfaCrrwp2atCu9+2JqBQayn+68mt?=
 =?us-ascii?q?L5Cwg2yyz72MdwVSXOshn8ZpPn16OgMeJoZkNoHkPz69JmGoFilYs9nJAQ2X?=
 =?us-ascii?q?4GhpqL+XoLiGjzMdtU2K/laHoNRCULw8LO4AT/1k1jNGyGyJzkWXqD2cthZM?=
 =?us-ascii?q?W6YmQO2i4n6MBKEqiU5qRenSRpulq4sR7RYf9lkzcZyPsu7mMagu4QtAo20C?=
 =?us-ascii?q?qSHq0SHVNZPSzwlxWE9tW+rKJKa2aydbi/ylFznc6uDL6cuAFQQnX5dYk4HS?=
 =?us-ascii?q?928Mp/NEjA0Hrp6oHrYNPQd84ctgWIkxfciOhYMIkxmeQOhSpmP2L9oHIkxv?=
 =?us-ascii?q?UljRxhw566ppKLK2Zz86KjBB5XKDn1a9kU+jH3gqZUhtyW0Jy3HpV9BjULW4?=
 =?us-ascii?q?PlTfapEDIUqPTmOB+CHycmqneeALbfHhGQ6F1gr33RF5CmLHWXJHgCzdV+Xx?=
 =?us-ascii?q?mRPk1fgAYaXDUghJE2Cx6ly9b8f0tj4TAR/FH4oANWyu10Lxn/TnvfpACwZz?=
 =?us-ascii?q?cwSZifKgdW7w5a50fNLcOS9/98ED9G/pC6qAyNK3ebZxhTDW0TXUyFBlTjMa?=
 =?us-ascii?q?O16tnb6eSYAfC+L/TWa7WUteNeT+uIxY6o0oZ++zaMN8OPPmRtDvEiwkpMR2?=
 =?us-ascii?q?p5G8XCmzoTUCEXiS3NYNCBpBum+S14sNq/8PL1VwLr/4ePDKFSMdp38RCsna?=
 =?us-ascii?q?iDL/KQhDp+KTtA0ZMM3WXIyL8R3F4TjyFhaSChEbABtS7WUKLdgatXDx8Aay?=
 =?us-ascii?q?NvL8tE9bk83gdXNc7dlNz1yqZyjuQpBFddSVzhhsapaNQOI2G8MlPHGUmKOK?=
 =?us-ascii?q?2bKj3M3876er28SbJOg+VOrRGwuiiUE1XlPjudkznlTRevMftDjCuDJhxRpJ?=
 =?us-ascii?q?m9cgpxCWjkVN/mbhy7MNlqjTw52LE0g2nFNWgHPDhifENCsKeQ4TlbgvphAW?=
 =?us-ascii?q?xB6GRqLe2elyae9enYJcVejfw+KyB5h+9LqF4nx7JT7yZaDKh8nCbCo88oqU?=
 =?us-ascii?q?yqm++MzSRPVBtItyYNhYSXsEEkMqLcoN0Ie3/B8QlFyGKKERUR749nD9r1oa?=
 =?us-ascii?q?FL4t7Gka/ybjBY/ISQtfARHcfZYOKONH4wN1K9AzPOAwYtTTevMXDZwUdala?=
 =?us-ascii?q?fWvkWYspUg4qrtmp4VVqVSHAgtG+8XEFZNHdoMOp57Uzoo17mBg5hMrVOkqh?=
 =?us-ascii?q?DVSMISlZndSPuWAfKnJDvRqLRAYFNcyLj9IKwQO5f91kgkbUN1ysCCOkzfWp?=
 =?us-ascii?q?hopSlnZxV89EBM9nd5Zm4+wUTobkWq+nBFUbb+nBkxjAJlJ+Ak9Cvt5VoxDl?=
 =?us-ascii?q?7LojYg1kg3hdjhxzuWdXS5eKW3WodfEGzwvkgtM5X2RS5xbAuvjQplMivJQ/?=
 =?us-ascii?q?RaiL42MShCjALMtJoHIuJVV6paZx4Mwu/fM/wzzXxfpz+hyEsB4vHKX98qqw?=
 =?us-ascii?q?ouddaAontL3AQrOME0Iaj4J6dTyFVUwKWUsXnsntg43QtWAk8G826IYicT8B?=
 =?us-ascii?q?gQP6QiOjGA5eVp4wXEnCFMLixEd/curf8i2k45P+mah3bs3rpHJ1qZOOmPaa?=
 =?us-ascii?q?+U7SyIqc6PR1ornmwMmkhV+7VsmZM/fE6Ef0QuyqaNDRMPNNqEJQwDPORI83?=
 =?us-ascii?q?2GRjqDqeXAx9pOOoy5Eu35BbuVuL08nlOvHAFvGZ8FqMsGAM//gwnjMc77Ie?=
 =?us-ascii?q?tdml0W7wPxKQDAVa4YdQ=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2BkAgCmKkxe/wHyM5BmHAEBAQEBBwEBEQEEBAEBgXuBf?=
 =?us-ascii?q?YEYVAEgEiqEFIkDhmADBoE3iXCRSgkBAQEBAQEBAQEtCgQBAYFMgi9FAoInO?=
 =?us-ascii?q?BMCEAEBAQUBAQEBAQUDAQFshTcMgjspAYMCAQUjFS0UEAsYAgImAgJXBgEMB?=
 =?us-ascii?q?gIBAYJjPwGCViUPrXGBMoRJQUCDaYE+gQ4qiVuCY3mBB4E4D4JdPoJkAQIBA?=
 =?us-ascii?q?oRxgl4EkCKHMEaXcoJFglCEf48EBhyDRpdgLY5AiHeUWCKBWCsIAhgIIQ+DJ?=
 =?us-ascii?q?wkWMRgNjlWIT4UIAVQjAzACBQaQXAEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 18 Feb 2020 18:21:28 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 01IIKDP1111818; Tue, 18 Feb 2020 13:20:13 -0500
Subject: Re: [PATCH v7 01/12] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 James Morris <jmorris@namei.org>, Serge Hallyn <serge@hallyn.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Helge Deller <deller@gmx.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <c8de937a-0b3a-7147-f5ef-69f467e87a13@linux.intel.com>
 <f56fbb5c-1477-44d5-7346-85a1ca0869dc@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <00025c5f-d497-f541-710a-bc3ee3665652@tycho.nsa.gov>
Date: Tue, 18 Feb 2020 13:22:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f56fbb5c-1477-44d5-7346-85a1ca0869dc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-man@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, oprofile-list@lists.sf.net,
 Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/17/20 3:06 AM, Alexey Budankov wrote:
> 
> Introduce CAP_PERFMON capability designed to secure system performance
> monitoring and observability operations so that CAP_PERFMON would assist
> CAP_SYS_ADMIN capability in its governing role for performance
> monitoring and observability subsystems.
> 
> CAP_PERFMON hardens system security and integrity during performance
> monitoring and observability operations by decreasing attack surface
> that is available to a CAP_SYS_ADMIN privileged process [2]. Providing
> the access to system performance monitoring and observability operations
> under CAP_PERFMON capability singly, without the rest of CAP_SYS_ADMIN
> credentials, excludes chances to misuse the credentials and makes the
> operation more secure. Thus, CAP_PERFMON implements the principal of
> least privilege for performance monitoring and observability operations
> (POSIX IEEE 1003.1e: 2.2.2.39 principle of least privilege: A security
> design principle that states that a process or program be granted only
> those privileges (e.g., capabilities) necessary to accomplish its
> legitimate function, and only for the time that such privileges are
> actually required)
> 
> CAP_PERFMON meets the demand to secure system performance monitoring and
> observability operations for adoption in security sensitive, restricted,
> multiuser production environments (e.g. HPC clusters, cloud and virtual
> compute environments), where root or CAP_SYS_ADMIN credentials are not
> available to mass users of a system, and securely unblocks accessibility
> of system performance monitoring and observability operations beyond
> the root and CAP_SYS_ADMIN use cases.
> 
> CAP_PERFMON takes over CAP_SYS_ADMIN credentials related to system
> performance monitoring and observability operations and balances amount
> of CAP_SYS_ADMIN credentials following the recommendations in the
> capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability is
> overloaded; see Notes to kernel developers, below." For backward
> compatibility reasons access to system performance monitoring and
> observability subsystems of the kernel remains open for CAP_SYS_ADMIN
> privileged processes but CAP_SYS_ADMIN usage for secure system
> performance monitoring and observability operations is discouraged with
> respect to the designed CAP_PERFMON capability.
> 
> Although the software running under CAP_PERFMON can not ensure avoidance
> of related hardware issues, the software can still mitigate these issues
> following the official hardware issues mitigation procedure [2].
> The bugs in the software itself can be fixed following the standard
> kernel development process [3] to maintain and harden security of system
> performance monitoring and observability operations.
> 
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

[...]
