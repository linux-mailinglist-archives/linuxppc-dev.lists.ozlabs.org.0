Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E315AE71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 18:11:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HmPh5rWZzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 04:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.27.198;
 helo=updc19pa23.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=HrG1I0rk; 
 dkim-atps=neutral
Received: from UPDC19PA23.eemsg.mail.mil (UPDC19PA23.eemsg.mail.mil
 [214.24.27.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HmM25fs2zDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 04:08:44 +1100 (AEDT)
X-EEMSG-check-017: 58471951|UPDC19PA23_ESA_OUT05.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; d="scan'208";a="58471951"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UPDC19PA23.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 12 Feb 2020 17:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1581527315; x=1613063315;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aWcpaQ2lwYKfT5rmL/YVmNrCq+9+F5btAHN8rXcBXIY=;
 b=HrG1I0rkOyakdXQ/7bU4lUhHSs0Me8d41vd68voZXmrCXJjsLwY+lBwr
 A12kpFjHTjZnGMZsleO26intMkILsqSikKDPJjuZ8xCbZyCdnbzleEwEN
 pLZkg+H5jMgnyOeY60bdkxIK7Iq2Y0urk891CaEA6NK/eAetBm0iScqdS
 N6I3egcqeVHEAaKmNILMWCKFOE5YzZSHpLSuxPeTuo6IlRzeN5IjOUbeP
 basvRuUZ7jHzK+zbek40wAsg0aTPPmYWpThvvADFUG7EJ8bkDM70s81yw
 EkdPo9nVqx3cGs+0j9z9CQ2z0nhKR7eIfEiboX/Nn5+tA9uRxkrmKDu4u Q==;
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; d="scan'208";a="39023161"
IronPort-PHdr: =?us-ascii?q?9a23=3AI5+WUxQ9NnkZQh44LeZYh5jg9dpsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa65ZRSPt8tkgFKBZ4jH8fUM07OQ7/m8HzJdqsfe+Fk5M7VyFD?=
 =?us-ascii?q?Y9wf0MmAIhBMPXQWbaF9XNKxIAIcJZSVV+9Gu6O0UGUOz3ZlnVv2HgpWVKQk?=
 =?us-ascii?q?a3OgV6PPn6FZDPhMqrye+y54fTYwJVjzahfL9+Nhq7oRjeu8UMgIZvKqk9xx?=
 =?us-ascii?q?/Lr3BVZ+lY2GRkKE6ckBr7+sq+5oNo/T5Ku/Im+c5AUKH6cLo9QLdFEjkoMH?=
 =?us-ascii?q?076dPyuxXbQgSB+nUTUmMNkhpVGAfF9w31Xo3wsiThqOVw3jSRMNDsQrA1XT?=
 =?us-ascii?q?Si6LprSAPthSwaOTM17H3bh8pth69AvhmvuwJwzJLVYIGNNfpxYKXdfc8BRW?=
 =?us-ascii?q?FcWspdTjFNDp+gY4cKCecOM/xYr43grFUQqxWwCxSnCOf2xjJGgnL62Ks32P?=
 =?us-ascii?q?kjHw7bxgwtB88AvmrarNv1N6kcX+66w6bKwjrfYP1bwiv95YvSfxw9vf2BU7?=
 =?us-ascii?q?B9fMzMwkcvDQPFiVCQpJT4MTOJyOsNq2ib4PRmVemylmAnrht+ojyrxsgyio?=
 =?us-ascii?q?jCm4UYykvZ+iVi24s1Od25R1J7Yd6jCpdQsTqaOJFsTsMtRGFopj83x7sbsp?=
 =?us-ascii?q?C4ZCgH0IkryhHQZvCdc4WE/wjvWPieLDtmnn5pZbSyjAuo/0e60O3zTMy03U?=
 =?us-ascii?q?5PripCj9bDqGgA1wfW6sibUvt9+Vqh2SqX2wDT9O5EJUc0mLLHK5E72L4wl4?=
 =?us-ascii?q?cTsV/ZEi/3nkX2gqiWdl469ee08ejnfrXnqYOcN49zkA3+NLghmtejDugiNw?=
 =?us-ascii?q?gOXmyb9fy91L3l40L5XK1HguA5n6TWqpzXJdkXqrSnDwJazIov8QuzAy+j0N?=
 =?us-ascii?q?sCnHkHKFxFeAiAj4jsI1zOO+33DeykjlSwkDZk2/DGPrr7DpXLNXjMiq3tfb?=
 =?us-ascii?q?l6605C0AYz18xQ54pICrEdJ/L+QlX+tNjGAR42LQO1w/zrB85g1owDQ22PBK?=
 =?us-ascii?q?yZMKTMsVKT4uIvIu+MZJIauTrnKvgl4eLugmE9mVMHYaap2p4XYmiiHvt6O0?=
 =?us-ascii?q?WZfWbsgtAZHGgQugoxUuPrh0ODUTJJfHayQ7gz5is8CIK4CofDR5ytgLuf3C?=
 =?us-ascii?q?qgEZ1WY3pJClGIEXvya4qEXPIMYjqIIsB9ijwESaShS4g52BG2qgD616RoLv?=
 =?us-ascii?q?DV+yADtJLj0tZ15/fJmh4v6zN7FdmS33uKT2FukWMCXyU207xnoUxh1leD1r?=
 =?us-ascii?q?B1jOZEGtxW+fxESQQ6OoDGz+x8Fd/yXhjNftCTSFapWt+mGy0+Tsotw98SZE?=
 =?us-ascii?q?ZwA9CijhHF3yqlBL8YjKaLC4Ip/aLcxXfxO9xxxGrB1Kkkl1MmWNdANXW6hq?=
 =?us-ascii?q?5j8AjeH4zJnF+fl6arb6gc2i/N9GSezWqKpk5VSwpwUaTDXXACaUrat9X55k?=
 =?us-ascii?q?XeT7CwDbQrKBdOycmHKqFScN3mkU1GROv/ONTZe2+xmWCwBRGOxryWd4rmYW?=
 =?us-ascii?q?Ed0z/dCEgYkgAT+2iJNQ4lCyelomLeCiFuFF31b0Pt9+l+tG20Tksuww6WaE?=
 =?us-ascii?q?1h0qK/+gQJivyEV/MTwrUEtT87qzVzAVm9xdPWC9WHpwZ7YqVcYM094FZc2G?=
 =?us-ascii?q?LYsQx9IoKvL6R4ilECdAR3ulvk1w9rBYVYjcgqsHQqwRJpJq2G1lNBdyiV3Z?=
 =?us-ascii?q?PuNb3NLGn94hSvZ7TK1VHEytmW4acP6PU+q1Xspg2pEVAi83p/2dlPz3Sc/o?=
 =?us-ascii?q?nKDBYVUZ/pSkY47QV6p7XHYikm/I7UzmdjMayvvTDYwd4pA/Elyhm4dddFLK?=
 =?us-ascii?q?yEDBPyE9EdB8W2Lewqg0amYwkaM+BW8K47Idmmd/6c166tJupgnS+pgX5d74?=
 =?us-ascii?q?BgykiM7TZzSvbU35YZxPGVxgmHWC35jFi/qcD7g5tLZTYOHmqjzijkAYpRab?=
 =?us-ascii?q?NyfIsQCWehOcu3xs5giJ7rQ35X7kSjB08A2MC3YxqSdFz93QxI1UgNvXOnni?=
 =?us-ascii?q?64xSRukz41tqqfwDDOw+P6eRocJGFLXmZigkn3LIi0ld8aWEyobggvlBe/+U?=
 =?us-ascii?q?n6wK1brrxlL2bPWUdIYzT2L2Z6X6uys7qCZNRP6IkpsSVMS+m8Z0qVSrvjrB?=
 =?us-ascii?q?sbyS/jGHFexD8jfTGwppr5hwB6iH6aLHtronvZeMVwxRPF6NPBW/FexCYJRC?=
 =?us-ascii?q?5+iTTMHFe8Jdyp8c+ImJfEt+C0T3ihWYFLcSn30YOAszO25WhwDh2lnPC/gM?=
 =?us-ascii?q?fnERUm0S//zdZqUzjHoQ3mbYnx0qS2K/5ofk5tBFXk8cp1Bpl+kpcshJEXwX?=
 =?us-ascii?q?UanI+V/XsbnmroMtVUx7j+bHwTSj4P2dLV5xLl2EJ7JHKT2435TmmdwtdmZ9?=
 =?us-ascii?q?SieGwWwT494ttJCKiK9rxEmzV6ol6ioQLWe/h9kS8XyeEy534Cn+EJpA0twz?=
 =?us-ascii?q?2fArAVGUlYJjbjmg+S79+gsapXZHygcaSq2EVimtChCamIohtAV3bhZpciAS?=
 =?us-ascii?q?hw491lP1LPy3Dz7oDkeN/NbdMcrBGUkhHAj/RLJ5I1jPYFmS1nOWflt30/1+?=
 =?us-ascii?q?E7lQBu3Y29vIWfNWpt5ri2AhhZNjLvYcMe4T7tjaFZnsaZ24CgAI9tFSkMXJ?=
 =?us-ascii?q?vtVfioCi4dtez7NwaSFz0xsnabGb7CHQCE8khmtHLPHI6wOn6NJ3kW19BiSw?=
 =?us-ascii?q?OcJEBFnA8UWzA6lIYjFg+23MzhbFt55jcJ61HirhtD1O1pOAP5UmjCugiocC?=
 =?us-ascii?q?04SIOfLBpX9QFC50TVMc2Y7u9oGyFY/5uhrBGCK2CBZgRIC30JVVKAB1z5Ir?=
 =?us-ascii?q?au4tzA+fCCBuWiN/vOfamOqetGWveO352v14tm/jaRNsWJMXlvFP471VRZXX?=
 =?us-ascii?q?B/BcvZny8DSysNlyLCd8Sbvguz+jVrrsCj9/TmQBnv5YyJC7tdNdVv+g22jr?=
 =?us-ascii?q?yZN+GKmiZ5KDBY1pwXyH/G07cTxkIdiyZrdzO1C7QPqTbNTL7Mmq9QFxMbby?=
 =?us-ascii?q?JzNMxO760i2glBI8Hbhsnx1rFiiP46FllEWkL7msGtZMwKJXqwNFLBBEaXKr?=
 =?us-ascii?q?uGISfHzN3wYaO5UbdQlvlbtwWsuTaHFE/uJiiDlzbtVxGgKuxMiCCbPBpDuI?=
 =?us-ascii?q?GhaBZtDm7jTNPpaxGhLdB4kyU8wacoiXPSKW4cLT98fltJrr2R6yNYn/p+F3?=
 =?us-ascii?q?VC7nV7N+mEnTiW7+3DJ5YIvvtkHD50m/hZ4Hsk0btV6j9LRPhvlCvVtN5urE?=
 =?us-ascii?q?mskvOTxTp/TBpOtjFLiZqPvUVjP6XZ65ZBVW/f/B0T8WqQFg4Kp9p5Ctzvoq?=
 =?us-ascii?q?xQz9/Pm7/uKDdG7d3Z5tUcB8fKJ8KdKnYhMgTmGCTSDAQbST6nL2bfh1ZSkP?=
 =?us-ascii?q?uK7H2asoA6qoTwmJoJUrJbT0I6FvcbCkRjAdwDL4x6Xi0rkbGFls4E/3m+ow?=
 =?us-ascii?q?fLRMVcoJ/HUuieAfL1KDaWlbNEfQcHwavkLYQPMY32w01ial9mnIvUH0rcRN?=
 =?us-ascii?q?9NoiNubwIvpEVN8WN+TnEo207/ZAOt+mEcGuCpkREokQt+Yvgt9DD041stIV?=
 =?us-ascii?q?rKviQwmlErmdr5mTCRbCLxLKCoUIFSCir0sVUxM5ziTwZtdwKyh01kNCzYSL?=
 =?us-ascii?q?9Kkbtgen5kiBXGtZtMB/FcV6tEbwEUxf2NYPUoy1tcoD29xUBb/evFFYdilA?=
 =?us-ascii?q?wyfJ6ornJA3R9jbdEtJazIOKVF10VfibyQviKz0uAxwRQeJ1oW8G+Ify4JuU?=
 =?us-ascii?q?gIOaM9KCqz5OBs7haCmzRbcmgWS/Uquu5q9l86O+mYyyLg0rhDKl2+NuCGNa?=
 =?us-ascii?q?yZoW3AmdeLQlwuzEMIkVdK/bxt3McnckqUTFwvzKCLGxQIM8rCJxtVYNBP+3?=
 =?us-ascii?q?fNZymBrP/BwZVvP4WyDuroV/OBtL4IgkK4GwYkB4AM7sUHHpmx30DUNN/nI6?=
 =?us-ascii?q?AfyRUj/QjrOU6FA+pTeBKQizoHvc6/w4Ft3YVHJTESH399MSOp6bbTvAMqh+?=
 =?us-ascii?q?CDXNguaHcAQoQELm42WNG9myNBuHRAFCO30uUXyAiD6z/zuD3cDD39b9p4eP?=
 =?us-ascii?q?eZfhdsCNCt+TUj6Ki6k0XX8pvEK2H8K9tipsfF6fkGqJafF/NUUb59vl/Ym4?=
 =?us-ascii?q?lFW3yqVHXCHsSwJ5fqd4Yjd8T0CnemUlOljzI5VcHxM8ixLvvAvQa9bIJZoI?=
 =?us-ascii?q?SKlBo+Oca7FTYAU0N5o+wT6bM6bxAPapw4ZgDAswU4Krz5IQGE39HoSGGof2?=
 =?us-ascii?q?h4Vf5amN6maqRXwixkVeqzzH8tX9lu1OWs2VIcT5ENyBfFzLCsYJcIAnu7IW?=
 =?us-ascii?q?BUZwia/XlxrGNmLOtnh75kkR4=3D?=
X-IPAS-Result: =?us-ascii?q?A2CrAwCYMERe/wHyM5BmHQEBAQkBEQUFAYF7gX2BbSASK?=
 =?us-ascii?q?oQUiQOGZQEBAQEBAQaBN4lwkUoJAQEBAQEBAQEBNwQBAYRAAoJtOBMCEAEBA?=
 =?us-ascii?q?QUBAQEBAQUDAQFshUOCOykBgwIBBR0GBAsBBUEQCQIYAgImAgJXBg0GAgEBg?=
 =?us-ascii?q?lcMP4JXJZAjm3l/M4VKg0WBPoEOKow+eYEHgREnD4JdPodbgl4EjU2CT4dvf?=
 =?us-ascii?q?JZvgkSCT4pGiTYGHIJIiBKQOy2reSKBWCsIAhgIIQ+DJ1AYDY4pFxWOLCMDM?=
 =?us-ascii?q?AKRXwEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 12 Feb 2020 17:08:33 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 01CH7OZD127971; Wed, 12 Feb 2020 12:07:25 -0500
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
 <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
 <d7213569-9578-7201-6106-f5ebc95bd6be@tycho.nsa.gov>
 <2e38c33d-f085-1320-8cc2-45f74b6ad86d@linux.intel.com>
 <dd6a1382-7b2f-a6e6-a1ac-009566d7f556@tycho.nsa.gov>
 <8141da2e-49cf-c02d-69e9-8a7cbdc91431@linux.intel.com>
 <7c367905-e8c9-7665-d923-c850e05c757a@tycho.nsa.gov>
 <280e6644-c129-15f6-ea5c-0f66bf764e0f@tycho.nsa.gov>
 <950cc6a4-5823-d607-1210-6f62c96cf67f@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <46751eb9-deca-53cc-95fb-1602cfdf62a2@tycho.nsa.gov>
Date: Wed, 12 Feb 2020 12:09:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <950cc6a4-5823-d607-1210-6f62c96cf67f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Andi Kleen <ak@linux.intel.com>, Igor Lubashev <ilubashe@akamai.com>,
 James Morris <jmorris@namei.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Serge Hallyn <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Andy Lutomirski <luto@amacapital.net>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/12/20 11:56 AM, Alexey Budankov wrote:
> 
> 
> On 12.02.2020 18:45, Stephen Smalley wrote:
>> On 2/12/20 10:21 AM, Stephen Smalley wrote:
>>> On 2/12/20 8:53 AM, Alexey Budankov wrote:
>>>> On 12.02.2020 16:32, Stephen Smalley wrote:
>>>>> On 2/12/20 3:53 AM, Alexey Budankov wrote:
>>>>>> Hi Stephen,
>>>>>>
>>>>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>>>>> On 1/22/20 5:45 AM, Alexey Budankov wrote:
>>>>>>>>
>>>>>>>> On 21.01.2020 21:27, Alexey Budankov wrote:
>>>>>>>>>
>>>>>>>>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>>>>>>>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>>>>>>>>> <alexey.budankov@linux.intel.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>>>>>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>>>>>>>>
>>>>>> <SNIP>
>>>>>>>>>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>>>>>>>>>
>>>>>>>>>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
>>>>>>>>
>>>>>>>> So far so good, I suggest using the simplest version for v6:
>>>>>>>>
>>>>>>>> static inline bool perfmon_capable(void)
>>>>>>>> {
>>>>>>>>        return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
>>>>>>>> }
>>>>>>>>
>>>>>>>> It keeps the implementation simple and readable. The implementation is more
>>>>>>>> performant in the sense of calling the API - one capable() call for CAP_PERFMON
>>>>>>>> privileged process.
>>>>>>>>
>>>>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
>>>>>>>> but this bloating also advertises and leverages using more secure CAP_PERFMON
>>>>>>>> based approach to use perf_event_open system call.
>>>>>>>
>>>>>>> I can live with that.  We just need to document that when you see both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, try only allowing CAP_PERFMON first and see if that resolves the issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus CAP_DAC_OVERRIDE.
>>>>>>
>>>>>> I am trying to reproduce this double logging with CAP_PERFMON.
>>>>>> I am using the refpolicy version with enabled perf_event tclass [1], in permissive mode.
>>>>>> When running perf stat -a I am observing this AVC audit messages:
>>>>>>
>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { open } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { kernel } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { cpu } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>> type=AVC msg=audit(1581496695.666:8692): avc:  denied  { write } for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>>>
>>>>>> However there is no capability related messages around. I suppose my refpolicy should
>>>>>> be modified somehow to observe capability related AVCs.
>>>>>>
>>>>>> Could you please comment or clarify on how to enable caps related AVCs in order
>>>>>> to test the concerned logging.
>>>>>
>>>>> The new perfmon permission has to be defined in your policy; you'll have a message in dmesg about "Permission perfmon in class capability2 not defined in policy.".  You can either add it to the common cap2 definition in refpolicy/policy/flask/access_vectors and rebuild your policy or extract your base module as CIL, add it there, and insert the updated module.
>>>>
>>>> Yes, I already have it like this:
>>>> common cap2
>>>> {
>>>> <------>mac_override<--># unused by SELinux
>>>> <------>mac_admin
>>>> <------>syslog
>>>> <------>wake_alarm
>>>> <------>block_suspend
>>>> <------>audit_read
>>>> <------>perfmon
>>>> }
>>>>
>>>> dmesg stopped reporting perfmon as not defined but audit.log still doesn't report CAP_PERFMON denials.
>>>> BTW, audit even doesn't report CAP_SYS_ADMIN denials, however perfmon_capable() does check for it.
>>>
>>> Some denials may be silenced by dontaudit rules; semodule -DB will strip those and semodule -B will restore them.  Other possibility is that the process doesn't have CAP_PERFMON in its effective set and therefore never reaches SELinux at all; denied first by the capability module.
>>
>> Also, the fact that your denials are showing up in user_systemd_t suggests that something is off in your policy or userspace/distro; I assume that is a domain type for the systemd --user instance, but your shell and commands shouldn't be running in that domain (user_t would be more appropriate for that).
> 
> It is user_t for local terminal session:
> ps -Z
> LABEL                             PID TTY          TIME CMD
> user_u:user_r:user_t            11317 pts/9    00:00:00 bash
> user_u:user_r:user_t            11796 pts/9    00:00:00 ps
> 
> For local terminal root session:
> ps -Z
> LABEL                             PID TTY          TIME CMD
> user_u:user_r:user_su_t          2926 pts/3    00:00:00 bash
> user_u:user_r:user_su_t         10995 pts/3    00:00:00 ps
> 
> For remote ssh session:
> ps -Z
> LABEL                             PID TTY          TIME CMD
> user_u:user_r:user_t             7540 pts/8    00:00:00 ps
> user_u:user_r:user_systemd_t     8875 pts/8    00:00:00 bash

That's a bug in either your policy or your userspace/distro integration. 
  In any event, unless user_systemd_t is allowed all capability2 
permissions by your policy, you should see the denials if CAP_PERFMON is 
set in the effective capability set of the process.

