Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D022B15AC4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 16:47:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HkXw5Lx4zDqRc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 02:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.24.195;
 helo=ucol19pa35.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=ICivGdvU; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Feb 2020 02:45:42 AEDT
Received: from UCOL19PA35.eemsg.mail.mil (UCOL19PA35.eemsg.mail.mil
 [214.24.24.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HkWB4KmszDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 02:45:42 +1100 (AEDT)
X-EEMSG-check-017: 70878809|UCOL19PA35_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; d="scan'208";a="70878809"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UCOL19PA35.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 12 Feb 2020 15:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1581522259; x=1613058259;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Nr7dM1SRxxK3wZoWZ5jzQnpKE/lg6bUGC83oPiR+z0E=;
 b=ICivGdvURhVYfcWBxr3dX+ug2rbCz99QULxENiSYciatMVSelBJI3Dym
 sq15GntRxX68pwB2VSH7ifeK9AoBtpoJuj1wXfVzbPnfGWjZBC+dkJFsQ
 C+ZxCkk29r6qmAXGpabE7gMhfYO7gmpr+H2Htv+MRJHIgPazawAioZWT/
 Ky1YDuLhYjZmp09oLWdCCaqH3poGVe9DrjKuUQLURp0nnO7cMe6yApuRY
 HVFjk3sy2e7oiKLvS4DP0wN9CRKUNpPMenIazXiv3gvy9+gP5jH/phjQd
 DLgB3i6MmnvlE7q7pndlo6UP3T0oTrLNte9h5VNQq8tfm7U117i+tiOUP w==;
X-IronPort-AV: E=Sophos;i="5.70,433,1574121600"; d="scan'208";a="39015106"
IronPort-PHdr: =?us-ascii?q?9a23=3A52qiURBQllbcRbsweQO0UyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP/6p8SwAkXT6L1XgUPTWs2DsrQY0raQ7f2rCTRIyK3CmU5BWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRq7oR/Qu8QWjodvKbo9wQ?=
 =?us-ascii?q?bVr3VVfOhb2WxnKVWPkhjm+8y+5oRj8yNeu/Ig885PT6D3dLkmQLJbETorLX?=
 =?us-ascii?q?k76NXkuhffQwSP4GAcUngNnRpTHwfF9hD6UYzvvSb8q+FwxTOVPczyTbAzRD?=
 =?us-ascii?q?Si86JmQwLmhSsbKzI09nzch9duh6xHvh2uux1/w5bVYI6LMvp+Yrjdds4eSW?=
 =?us-ascii?q?ZYQ8pdSzBNDoa6YoQBFeoBOftToZf7qVUAsBCyARCgCe3rxzNNgHL9wK803P?=
 =?us-ascii?q?k7EQzewQIuH8wAsHrXotv7OqgdXuK6w7XHwzjYc/Nb2i3w5JTUfh0vo/yBW6?=
 =?us-ascii?q?97f8rLyUkoEgPIlkieqZD7MDON1uQCrW6b5Pd9W+KqkWEnrwVxrSavx8wxjY?=
 =?us-ascii?q?TJnZ8aykvf+CVlwIc6Od24SElhbd6iC5tfrTuWN4RxQsM8WmxlvjsxxL4euZ?=
 =?us-ascii?q?OjYSQHx5sqywTfZvCaaYSE/B3uWPiLLTtlgn9uZaixiAyo8Ue6z+3xTsy00F?=
 =?us-ascii?q?FXoSVbitTMrXUN1wDL6siAV/t94l+t2TaR2ADX7eFJOVw0mrDBK54g374wjY?=
 =?us-ascii?q?AfsUXFHi/4n0X2l7GZeVk+9ui06+XofrXmppiGO49ylg7+Kbghlta6AeQ5Ng?=
 =?us-ascii?q?gCR2mb+eKi273/5UD1XbpHg/IsnqTZrZzWP9oXq6GnDwNPz4ov8xO/AC2n0N?=
 =?us-ascii?q?Qck3kHNlVFeBefgojyJl7OO+v1Deu/gluwkDdrwOrKPrv6AprXNHTDn7Dhfa?=
 =?us-ascii?q?hl505G1AUz1cxf545TCrwZOv3zXlH+tdPGAR45KQC72PvnB8hn2YMYWmKPBb?=
 =?us-ascii?q?GZPbjWsV+J4OIvPuaNaJUUuDb7N/gq+frugWUlll8aeKmjxYEXZ2ygHvR6P0?=
 =?us-ascii?q?WZZmLhjc0FEWgUsQsxUu3qhEeZUT5PfXmyRaU85i88CIKnEYfDQZ6tjaeO3C?=
 =?us-ascii?q?e+BJJWZ2RGBkqQHnfvcoWOQ+0MZz6KIs99jjwEUqCsS5c/2hGyqgD60btmI/?=
 =?us-ascii?q?HV+i0eu5LjzsJ66PDNmh4o6DN4FcOd03uCT2tshGMHWyc23LxjoUx60lqMy7?=
 =?us-ascii?q?R3g/lGGtFI5PNGTB06NZjCwOx+EdzyXRjBftiRQla8XtqmGS0xTs42w9IWZk?=
 =?us-ascii?q?Z9GtOijh/E3yexGb8aiaGEBJwu/aLAxXT+O8F9y3Pe3qk7k1YmWtdPNXGhhq?=
 =?us-ascii?q?Nn9QjcHYjJk0SDm6asdKQc3zPN9GOZwmeVuEFYUQhwUbjKXHwFZ0vWq8j56V?=
 =?us-ascii?q?3GT7O0FbsnNQ5Bw9aYKqRWct3pkUlGRPD7NdTcZGKxnGGwCgyTxr+WaIrlYW?=
 =?us-ascii?q?Ud3DncCEgCjQ8T+22LNQw/BienvmLfAyZiFVPpY0Pw7+Z+rGm3QVMzzwGPd0?=
 =?us-ascii?q?dhzaa6+gYJhfyATPMexqgEuCA8pDVuHVa90NXWB8CepwpgYqVcYMgw4FZB1W?=
 =?us-ascii?q?LFqQN9OoasILxlhl4baw53pV/h1w1rCoVclsgntGglwxR0KaKYy15BdC2X3Y?=
 =?us-ascii?q?r2OrLJLmn+5gyga7TM1VHF0NaW+6EP6Psip1XkpgGpGVIo82973NlNz3uc+p?=
 =?us-ascii?q?LKARIKUZ3rT0Y38wV6p6rBbykm/YzU0GZjPrOuvj/FwdIpC/Mvygy8cNdHLK?=
 =?us-ascii?q?OECAjyHtUfB8i2NuMngEambhYAPO9M7q40Otmpd/2c1K6qIelshiipjXlf6o?=
 =?us-ascii?q?Bnzk2M7zZ8SvLP35sdwfGXxA6HWCnnjFu7qc/3npxEZS0VHmq6zSjrGo5Qa7?=
 =?us-ascii?q?ZyfYkRD2euONO4xtNmh5H3QX5Y6FijCE0c2M+yeRqSbkT90RdM2kQQpHytgT?=
 =?us-ascii?q?G4wCBskzE1sqqf2zTDw//8exodNW5EWnJvjVf2Loiwi9AbXE6oYxI1mxui4E?=
 =?us-ascii?q?bw37Jbq7hnL2nPXUdIeDD7L2NnUqu3rLqCec9P6IgzvCVRSuu8ZE6VSr/nrx?=
 =?us-ascii?q?sdySPjEHNUxConeDGyppX5gxt6hXqTLXZyqHrZfdt8ygrB69PGWfFR2TwGST?=
 =?us-ascii?q?JihjnNA1iwJcWm/dKRl53bqOCxS3qhVoFPcSns1Y6AsTG05XdpARGlhfCzh8?=
 =?us-ascii?q?HnEQwg3i/9ytZnTj/HrAz5YoXxy6u6NudndFFyBFDg88p6Bp1+kowoiZEKw3?=
 =?us-ascii?q?gah4ma8GEEkWjtK9Vb37zxbH4XST4M2d7V7xDv2Fd/IXKR24L5SnKdz9N7aN?=
 =?us-ascii?q?mhfmMbwSE94N5QCKeS8rNEmTF5ol2irQLeefJ9hCsSyeMy6H4GhOEEoAgtzi?=
 =?us-ascii?q?KZArAJB0ZVJjbsmAqV4NC+tqpXeHyjfqS31Ep7hdqhFq2NohlAWHblfZcvBT?=
 =?us-ascii?q?V/7sZkPVLI0X3z7JzkedbKYdISsB2UjwnPj+xPJJ0tkfoKgDJtOXjhsn091+?=
 =?us-ascii?q?47kRtu0Imks4idMWpt+qO5DQReNjDuaMMT/TbtjalansmIxYygApJhGjATVp?=
 =?us-ascii?q?vyUf2oCC4StejgNwuWET08rmqbFqHFEg+E6EdpsWnCHIqoN36NIXkW19RiSA?=
 =?us-ascii?q?OBK0xYhQAeRC86kYIhFgC22Mzhd1906SoV5lHmpRpD0ORoOAThXWfFvguocT?=
 =?us-ascii?q?c0SJmELBpW7QFC5kHVPNea7uJyGSFY45KgoBaMKmydewRHE2UJVlaYCFDkO7?=
 =?us-ascii?q?mk/cPA/PSABuqiM/vOZq2DqepEWPeNxZKu0pZm/zCDNsiUPXltEec72kxdUn?=
 =?us-ascii?q?B9AcjZnC8PSyMPnSLXc8GbvAu8+jFwrs2n6/TrXwTv5YSLC7tTLNVg4Aq2jr?=
 =?us-ascii?q?2dN+6RgiZ5Ji1V1p0XynPS1Lcf21sSgTl0dzaxCbQAqTLNTKXIl69TDh4bbC?=
 =?us-ascii?q?VzO9VM764m0QlBI8rbhcnz1rFlgP86FU1FVVjgmsGvfsEKIme9NE/ZC0aPLr?=
 =?us-ascii?q?iJOTrLw8Tva6OmVbJQlPlUtwG3uTuDD0/jMTCDljbyWhCrMOFMijybPABEuI?=
 =?us-ascii?q?G6dBZtCGfiQMj7ZRKlKNV3lyE5waUohnPWMm4RKTx8c0JLrr2N4iJUm/Z/FH?=
 =?us-ascii?q?Jb7npjM+aEnz2U7/fXKpkIq/tnGCd0mPxA4HQ81bRV6DtIRPtvmCvdttRuuU?=
 =?us-ascii?q?2pkvGTyjp7VxpDsjJLhIONvUV/NqTV74JAVmjY8xIQ92WQCggKptt8Bt3qvK?=
 =?us-ascii?q?Bf18XPlKbtJzpZ7dLU8tUTB9LOJMKELnUhKxzpFyDQDAcfSj6rL27fjVRHkP?=
 =?us-ascii?q?6O7n2VsoQ6qp/0lZoVVLBbUF01FvUHCkVqB9ECPph3US0+kbKBj84H+2C+rB?=
 =?us-ascii?q?/PS8VepJzHUeiSAfr3IjaDkbZEfwcIwa//LYkLN4373VBiZUd+nIjTFErQU9?=
 =?us-ascii?q?9MrzZlbg81u0VN7GN+Qnc920L/dAyi/mIcGuCvnh41lgt+Zvwt+C3r41ctKV?=
 =?us-ascii?q?rAvDEwn1UpmdX5nTCRdyb8LKOxXYFQFir1uFE9MovhTAZvbA2yhlBrOSzaR7?=
 =?us-ascii?q?JekbRgb3pniAzCtptVH/5TU6lEbAUXxfGNaPUiyU5cpTm/xU9b+evFDoNvlA?=
 =?us-ascii?q?8rcZ6qsnJB1BpjbMYpKqDJOaVG0EZQi7mKvi+pzeAx3BQeK1wK8GKTfC4Hol?=
 =?us-ascii?q?cHNqI8Kyqv5Oxs5hSImyFfd2gUS/oqvvVq+1s5O+SBySLgzrFCJlmrOOyFKq?=
 =?us-ascii?q?OVomvAmtCSQlM2yEwIk1JI/bx30cc4b0qUTFojzLqXFxQHL8rNMxxaYNRI+3?=
 =?us-ascii?q?fOZyqOtv/NwZ1tNYWnCu/oVfOOtLoTgk+8GAYpHoIM7tkOH5W1yEHXM93nLL?=
 =?us-ascii?q?AcxRUw/wTkOk+FDO9SdRKVnzcIvdu/wIV03YZDPDEdB3tyMSGt6rbQvA8qj+?=
 =?us-ascii?q?KJXM0qbXcCQosEKnU2VdW9my5BpXRACze30uMdyAec9jP8oiXQDCLgb9d4YP?=
 =?us-ascii?q?eUZAhsCM2t+Tkl6Ki2h0Tb8pPAKGHmLd5ioMPA6fsGp5abDPNZVb19s1rAm4?=
 =?us-ascii?q?lfXHGlSWvPHsSpKJfqc4ksbMD0BWy+UlCljTI6Udvxb56RKf2hhQz4SJccmp?=
 =?us-ascii?q?SX1TYgMtH1QjgaFgd9tqcJ+a51Yw4EfbI/YBj1p0I/MbCyJEGT1dD4EEi3Lj?=
 =?us-ascii?q?4DdOVS1eW3YfRsyiMoauKrgC87QooS0/i88UlLQooDyB7Z26DwNMFlTSHvFy?=
 =?us-ascii?q?kFKE30ri0jmj0kb71jzw=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2CWAwCVHERe/wHyM5BlHQEBAQkBEQUFAYF7gX2BbAEgE?=
 =?us-ascii?q?iqEFIkDhmQBAQEBAQEGgTeJcJFJCQEBAQEBAQEBATcBAYRAAoJtOBMCEAEBA?=
 =?us-ascii?q?QQBAQEBAQUDAQFshUOCOykBgwEBAQEBAgEjBAsBBUEQCQIYAgImAgJXBg0GA?=
 =?us-ascii?q?gEBgmM/glcFII9umwR1fzOJDIE+gQ4qjD55gQeBEScPgl0+h1uCXgSNTYJPh?=
 =?us-ascii?q?298lm+CRIJOikaJNQYcgkiIEpA7Lat0IoFYKwgCGAghD4MnUBgNjikXFY4sI?=
 =?us-ascii?q?wMwApFfAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 12 Feb 2020 15:44:13 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 01CFhBBb080468; Wed, 12 Feb 2020 10:43:11 -0500
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
From: Stephen Smalley <sds@tycho.nsa.gov>
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
Message-ID: <280e6644-c129-15f6-ea5c-0f66bf764e0f@tycho.nsa.gov>
Date: Wed, 12 Feb 2020 10:45:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7c367905-e8c9-7665-d923-c850e05c757a@tycho.nsa.gov>
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

On 2/12/20 10:21 AM, Stephen Smalley wrote:
> On 2/12/20 8:53 AM, Alexey Budankov wrote:
>> On 12.02.2020 16:32, Stephen Smalley wrote:
>>> On 2/12/20 3:53 AM, Alexey Budankov wrote:
>>>> Hi Stephen,
>>>>
>>>> On 22.01.2020 17:07, Stephen Smalley wrote:
>>>>> On 1/22/20 5:45 AM, Alexey Budankov wrote:
>>>>>>
>>>>>> On 21.01.2020 21:27, Alexey Budankov wrote:
>>>>>>>
>>>>>>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>>>>>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>>>>>>> <alexey.budankov@linux.intel.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>>>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>>>>>>
>>>> <SNIP>
>>>>>>>>>>> Introduce CAP_PERFMON capability designed to secure system 
>>>>>>>>>>> performance
>>>>>>>>>>
>>>>>>>>>> Why _noaudit()?  Normally only used when a permission failure 
>>>>>>>>>> is non-fatal to the operation.  Otherwise, we want the audit 
>>>>>>>>>> message.
>>>>>>
>>>>>> So far so good, I suggest using the simplest version for v6:
>>>>>>
>>>>>> static inline bool perfmon_capable(void)
>>>>>> {
>>>>>>       return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
>>>>>> }
>>>>>>
>>>>>> It keeps the implementation simple and readable. The 
>>>>>> implementation is more
>>>>>> performant in the sense of calling the API - one capable() call 
>>>>>> for CAP_PERFMON
>>>>>> privileged process.
>>>>>>
>>>>>> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and 
>>>>>> unprivileged processes,
>>>>>> but this bloating also advertises and leverages using more secure 
>>>>>> CAP_PERFMON
>>>>>> based approach to use perf_event_open system call.
>>>>>
>>>>> I can live with that.  We just need to document that when you see 
>>>>> both a CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, 
>>>>> try only allowing CAP_PERFMON first and see if that resolves the 
>>>>> issue.  We have a similar issue with CAP_DAC_READ_SEARCH versus 
>>>>> CAP_DAC_OVERRIDE.
>>>>
>>>> I am trying to reproduce this double logging with CAP_PERFMON.
>>>> I am using the refpolicy version with enabled perf_event tclass [1], 
>>>> in permissive mode.
>>>> When running perf stat -a I am observing this AVC audit messages:
>>>>
>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { open } for  
>>>> pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t 
>>>> tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { kernel } 
>>>> for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t 
>>>> tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>> type=AVC msg=audit(1581496695.666:8691): avc:  denied  { cpu } for  
>>>> pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t 
>>>> tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>> type=AVC msg=audit(1581496695.666:8692): avc:  denied  { write } 
>>>> for  pid=2779 comm="perf" scontext=user_u:user_r:user_systemd_t 
>>>> tcontext=user_u:user_r:user_systemd_t tclass=perf_event permissive=1
>>>>
>>>> However there is no capability related messages around. I suppose my 
>>>> refpolicy should
>>>> be modified somehow to observe capability related AVCs.
>>>>
>>>> Could you please comment or clarify on how to enable caps related 
>>>> AVCs in order
>>>> to test the concerned logging.
>>>
>>> The new perfmon permission has to be defined in your policy; you'll 
>>> have a message in dmesg about "Permission perfmon in class 
>>> capability2 not defined in policy.".  You can either add it to the 
>>> common cap2 definition in refpolicy/policy/flask/access_vectors and 
>>> rebuild your policy or extract your base module as CIL, add it there, 
>>> and insert the updated module.
>>
>> Yes, I already have it like this:
>> common cap2
>> {
>> <------>mac_override<--># unused by SELinux
>> <------>mac_admin
>> <------>syslog
>> <------>wake_alarm
>> <------>block_suspend
>> <------>audit_read
>> <------>perfmon
>> }
>>
>> dmesg stopped reporting perfmon as not defined but audit.log still 
>> doesn't report CAP_PERFMON denials.
>> BTW, audit even doesn't report CAP_SYS_ADMIN denials, however 
>> perfmon_capable() does check for it.
> 
> Some denials may be silenced by dontaudit rules; semodule -DB will strip 
> those and semodule -B will restore them.  Other possibility is that the 
> process doesn't have CAP_PERFMON in its effective set and therefore 
> never reaches SELinux at all; denied first by the capability module.

Also, the fact that your denials are showing up in user_systemd_t 
suggests that something is off in your policy or userspace/distro; I 
assume that is a domain type for the systemd --user instance, but your 
shell and commands shouldn't be running in that domain (user_t would be 
more appropriate for that).
