Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957B145783
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 15:13:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482nSg15STzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 01:13:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.26.194;
 helo=usfb19pa31.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.a=rsa-sha256
 header.s=tycho.nsa.gov header.b=UTpzt/vc; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Jan 2020 01:08:30 AEDT
Received: from USFB19PA31.eemsg.mail.mil (USFB19PA31.eemsg.mail.mil
 [214.24.26.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482nLl05YZzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 01:08:30 +1100 (AEDT)
X-EEMSG-check-017: 47271789|USFB19PA31_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="47271789"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by USFB19PA31.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 22 Jan 2020 14:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1579702031; x=1611238031;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9SnZtO6/lKqH0FpjcRIuWCGZ4QNr4LfdCXgcu1r+3ok=;
 b=UTpzt/vcdm+XZoiJUF1hyKO7BKLNV8SA0/bEiWeZMBaheHWgwqhgywO1
 l7j2agy8KK6XscKC/K50XdSKlrlb8ZyNApaai8nilrh5yL/m4Y93hCG2A
 +oku5Iio2XL7JySHumn5K/UxsnMYcEMfmImPn/pDXvms/8v3mFMid9mhu
 yp0NNar2tMotTpbE/2hlAJquHeYAINgRsaFnJ3FKIWwXHMEx4f3C5ecRk
 R4WdQMK3ttelEcXgcb6huOhXBHEe2LQ8GMeLuJN+rHVsJwScJiBMuPihv
 NrkvYsBeXFigm9e3Q77ZmfN/U1Lb8uG6Ld9DS/YPG+fEppWa0JSXaXYjO A==;
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="32196114"
IronPort-PHdr: =?us-ascii?q?9a23=3AI0sK/RA1s5Hs/EZmIkqKUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP/5o86wAkXT6L1XgUPTWs2DsrQY0raQ6firBDFIoc7Y9ixbK9oUD1?=
 =?us-ascii?q?5NoP5VtjRoONSCB0z/IayiRA0BN+MGamVY+WqmO1NeAsf0ag6aiHSz6TkPBk?=
 =?us-ascii?q?e3blItdaz6FYHIksu4yf259YHNbAVUnjq9Zq55IAmroQnLucQanIRvJrwvxh?=
 =?us-ascii?q?fVrXdFe+Rbzn5sKV6Pghrw/Mi98INt/ihKp/4t68tMWrjmcqolSrBVEC4oOH?=
 =?us-ascii?q?0v6s3xshnDQwqP5n8CXWgTjxFFHQvL4gzkU5noqif1ufZz1yecPc3tULA7Qi?=
 =?us-ascii?q?+i4LtxSB/pkygIKTg0+3zKh8NqjaJbpBWhpwFjw4PRfYqYOuZycr/bcNgHXm?=
 =?us-ascii?q?dKQNpfWDJdDYO9d4sPDvQOPeBEr4nmulACqQKyCRSwCO/zzzNFgHH53bc+0+?=
 =?us-ascii?q?88Dw/I2gIuFM8KvHjNstn4MKIeXOaox6fK0DrDdetb1yrj5ojGch4vov+CUr?=
 =?us-ascii?q?x/fsXT1UYhGBjIjkmSpIH/Iz+ZyuoAvmqd4uF9VeyvkWknqwRprzay2scjlJ?=
 =?us-ascii?q?HJhoILxVDC6C533YM1Kse8SE5/f9GlEIZbuiaBN4RrWcMvWH1ouSYmxb0Gvp?=
 =?us-ascii?q?63Zi4KyI89yBLFZPyHdJaI7wvlWe2MLzl4g3dld6i+hxa06UWgyfPzVtOy0F?=
 =?us-ascii?q?lUqipJiN7MtmoC1xDL78iIUP1980W71TaIzQDT5edJKl03m6rDM5Mt37E9m5?=
 =?us-ascii?q?UJvUnDAyP6glv6gaCIekk+5+Sl7fnsbK/8qZ+GLYB0jxnzMqEpmsOiH+s1Kh?=
 =?us-ascii?q?MOX22H+eSk073j4FH5TK1KjvIolqnZt4jXJdgBqa6jAg9Vz50j5wy+Dzeg3t?=
 =?us-ascii?q?QYmmIHI0xZdx6dk4joO03BIPD/DfulhVSjjCxryOzcMr3kA5XNKmDPkLbnfb?=
 =?us-ascii?q?lj905R0Bc/wN9Q6p5OCrwNPej/VlH+udDGFBM1LhS4w+P9B9V80oMeV3iPAq?=
 =?us-ascii?q?icMK7Kql+H+/kvLvKQZI4VpDn9K/8l6+TojX8ig1ARZ6ap3ZwJaHygBPRpP1?=
 =?us-ascii?q?2ZYWbwgtcGCWoFpA4+Q/LliVKcUT9ffW29X78h6T4hDoKmDoDDRp62jbyF3S?=
 =?us-ascii?q?e7GIBWZ29cBlCNF3foa5uLW/MWZC2OJc9hlyQOVaK9RI85yRGuqAj6xqJ9Ie?=
 =?us-ascii?q?rQ5CIZuozs1Nlv6+3IiRE97yZ0D8OD02GKTmF0gmQIRyEt0aBwpExy0FaD0a?=
 =?us-ascii?q?xij/NEEtxT4utDUh0mOp7E0+x6F9fyVxrZftiXVFapXM+mADAqQ9Iwxd8ObV?=
 =?us-ascii?q?x9FM+/gR/dxSWlHqUZl7uRBJw76qjcxWT+J95hy3ba06ksl0MpTddKNWK4na?=
 =?us-ascii?q?N/9BbcB5TPk0qHk6amb6Mc3DTC9G2b12qBoFlYUBJsUaXCRX0fY0rWrdL25k?=
 =?us-ascii?q?PFVLKuE6ooPRZBycGYNqtGcMHmjVJDRP37ItTRf3qxm3usBRaP3r6MbpDle2?=
 =?us-ascii?q?Mc3CnHDkgEkgMT/WuCNQckHSqhp2PeDDpzFVPgeU/s8O9+qG+lQU8w1Q2Fc0?=
 =?us-ascii?q?ph17+t8B4PmfOcU+8T3q4DuCo5qTV0G1G939TMBNqbvQZheL9TYdMh4FdG02?=
 =?us-ascii?q?LWqQp9M4ekL6BjgF4ebgt2s1nv1xVxFoVPj8wqoGk2wwp1LKKSyElBeC+A3Z?=
 =?us-ascii?q?DsJr3XLXH//Aqoa6HLwFHe0dmW+qAV5PQmqlXjogCpG1Ej83Vhz9lazX+c6o?=
 =?us-ascii?q?/WAwoVVJL7Slw3+ARip7HGfik94JvZ2mZyPqmysj/PwNEpC/U/yhamYdhfNL?=
 =?us-ascii?q?mIGxPoE8IAHMiuKO0qm16mbh4eO+BS7qE0Ndu8d/SawK6rIPpgnDW+gGRf+o?=
 =?us-ascii?q?99z0aM9zdnSuPTxJYK2fSY0RCdWDvmi1ehqM/3k5heZT4OBmq/1TTkBIlJa6?=
 =?us-ascii?q?13ZYYEF3yjLNOzxtV6mZHtQXtY+0SlB18c2c+mZACeYEbg3QdIz0QYvWSnmT?=
 =?us-ascii?q?ekzzxzizwprLCQ3CnQzOT5bhYIIWlLRHV+jVfrJIi0i84VXUizYggpjhSl41?=
 =?us-ascii?q?36yLZdpKRnNWbTW1tIfy7oIGF4SauwtruCY9ZV5Jw0tiVXVfy2YUqGRb7lvx?=
 =?us-ascii?q?sazyTjEnNFxD8lbTGqtYv2kgd6iG2HKHZzqHrYecdqyRjD49zcQOZb3iAaSy?=
 =?us-ascii?q?lglTnXGl+8MsGr/dWRkJfDqPq+V2O6VpBIdynk14aAuzW65WFwBh2/hf+zkM?=
 =?us-ascii?q?X9EQcmyS/7y8VqVSLQoRfyY4nr06C6Pfh6cUZ2HlDz9816Godln4QqnpEQ3G?=
 =?us-ascii?q?IWiYmS/XoCiW3zK8lU2bribHoRQj4G29vV7xL/2E1gNH6J3Z/5VmmZwsR7Yd?=
 =?us-ascii?q?m1f3gb1Tgn78BPEqub8LtEnS5tqFqisQ3ReeR9nisayfY28n4ameAJtxY2wy?=
 =?us-ascii?q?WeHL8SB09YMjLolxiS6NC+tqpXbn61cbeszEp+gcyhDLaarw5GQ3b5ZowvHS?=
 =?us-ascii?q?xu4cVlNlLDznnz5pvjeNnKYtIZrgeUnAvYj+hJNJIxkeIHhShgOWL5pn0q0f?=
 =?us-ascii?q?U2jQZw0p6nvIiIMXlt8LilDR5fMz3/f9kT9S31jaZCgsaW2JiiEY9iGjgQWJ?=
 =?us-ascii?q?voTPSoEC8dtPj9NgaOFiE8pWmfGbbFAQCf70JmpWrVE5+3L3GXOGUZzdJ6SR?=
 =?us-ascii?q?aDPkxQmgYUXDQgkZ4/DQ2qy8vhcEB25jAV+FH0sAdDyuVtNxPnSGfQuB+oai?=
 =?us-ascii?q?soSJiYNBdW7wVC51rOPsOE9eJzHz9X84a7owyOMGObYh5HDWATVkOYAFDjO6?=
 =?us-ascii?q?Gk5cPc/OiAGuq+M/zObK2UpuxaSfiJyoig0o178DmSLMWDJGJiD/062kpYXX?=
 =?us-ascii?q?B5GMXZmzMURiwTliLNadObpRim9i12qMC/7OrkWAb16YSTDLtSNM1l+wqqjq?=
 =?us-ascii?q?ebK+6QmCF5JC5e1pwWwH/IyLge3EMUiyFhbDStEqoPtTTLTK3Onq9bFRkbaz?=
 =?us-ascii?q?l8NMFQ9aIzwhFNOdLHitPyzrN4lfk1C1FKVVzlm8GpeNcFI3unO1PZBUaLMr?=
 =?us-ascii?q?uGKCbFw87se6+zVbpQjOBMvR2qpTmbC1PjPiiElzTxUxCvMOZMjCeFMxxaoo?=
 =?us-ascii?q?29fQxhCWz5Q9LgdxK6PsF4jScywb01gHPHLm8cMT5gc0xTqr2c9z9XgvJ6G2?=
 =?us-ascii?q?ZZ9HpqMfGEmzqF7+nfMpsWrfRrAiB7lu9B5HQ6yr1V7DxYRPxvnyvSqN9uol?=
 =?us-ascii?q?68nuaS1DVtSABOpSpThIKXoUViPr3U9p1BWXbC4RIM4nycCxcUqNt/DN3gpa?=
 =?us-ascii?q?RQx8PRlKL8NjhC6cjY/cgCCMjOLsKILn4hPQDuGD7OAwsPVSSrOn3Hh0xBjP?=
 =?us-ascii?q?GS8WWYrpw7qpjqhZoPRaZXVEcrGfwGF0RlBt0CIIt3Xz89lL6bi9MH5We6rB?=
 =?us-ascii?q?bPX8haoJ/HWeyIAfn1KzaWk6NEZx0WzrP8N4gTMZf720N6YFlggIvKA1bQXc?=
 =?us-ascii?q?xKoiB5dQ87vkFN8Hl4Tm0u1EPocR2t4HANGv6uhBI2iRVxYf4r9Djy51c7PF?=
 =?us-ascii?q?3KpDE/kEMpg9XqnSiRcCLtLKe3RYxWCiz0t1QvPZP/Wgp1YgOynEN/OTfARr?=
 =?us-ascii?q?JRlKdgdXtxhA/So5tAB+BTQrBabx8LxvGXe/Io0UxGpiWg309H6vPPCYF+mw?=
 =?us-ascii?q?sybZ6ss3VA1hpnbN40I6zQOaVIwkFIhq2UpC+o1/sxzxMFKkYT/2OdZjQItF?=
 =?us-ascii?q?YLNrY4PSqo+PJj6QiYlztEYmgMWOIgouh2+UMlJ+SA0yXg3qZHKkCwMeyfMq?=
 =?us-ascii?q?yYu3DYlcGUW18/y10Hl1de8Lhy0McjaFaUV1s1wLuWFhUJMdDNJhpOb8ZI83?=
 =?us-ascii?q?jTZymOu/3XwZ1pJ4W9CvzoTeiWuaYQg0KkGhspHosV4ssbBJms1VjULcT5I7?=
 =?us-ascii?q?4fzxUi+gDrKU6BDPRIYxKLjCwHr9u+zJ9x04ldPCsSDnhjPiqt+7nbvAgqgO?=
 =?us-ascii?q?CMXN0ueHcVQpMENm4qWM29gyNZu3VADD+q0uMW0QSC9yHzpj7eDDXlctpjf+?=
 =?us-ascii?q?mbZQl3CNyt5zU//La5iUTN/pXdOW76L9JitcHL6e8AoJaHEfxUR6Fns0jAg4?=
 =?us-ascii?q?lYW2CqU2nXHN6yP5jwcY4sbdL1Cna+TFOzkjY1T8bqPNaxNaWIhQDoRZ1IsI?=
 =?us-ascii?q?mAxjwjLsG9GisYGxhuu+EJ/Lh8ahEbY5onfR7osBwzN6iiIAeE1dWjWHyiKT?=
 =?us-ascii?q?5MQPZD1+q6f71XzzY2Ye++0ncgSI81z/XkuXIKEbgOgwHT1L6JeoVXVyv0BD?=
 =?us-ascii?q?QJcgHCtSco0WJ8Ou80weAh6BfJt0QMdTGNaOFtLmdDuod4TXqWLGV7CyIDW1?=
 =?us-ascii?q?aGipTE4xKrwfhG9i9Qj9tVl/ZZuWL5oJjefDWycKOuoJTR9SEnaI51jbd2NN?=
 =?us-ascii?q?nYPsaetJ7Y1gfaRZ3UvxzNBDW2DNJGi9NQJ2ReW/AOlmY7b59V8bFd4FY8A5?=
 =?us-ascii?q?9tb4dED7Mh8/XzM2tp?=
X-IPAS-Result: =?us-ascii?q?A2AFAQAzVihe/wHyM5BlHQEBAQkBEQUFAYFqBQELAYF8g?=
 =?us-ascii?q?RhVIBIqhBKJA4ZvBoE3iW6RSQkBAQEBAQEBAQEtCgEBgUyCL0UCgj43Bg4CE?=
 =?us-ascii?q?AEBAQQBAQEBAQUDAQFshTcMgjspAYJ6AQUODwYVLRQQCxgCAiYCAlcGAQwGA?=
 =?us-ascii?q?gEBgmM/AYJWJQ+uWIEyhElBQIMwgT6BDioBiUyCY3mBB4E4D4JdPoJkAQIBA?=
 =?us-ascii?q?oRvgl4EkBaHHEaXWoJDgkuEdI5uBhuDP5c4LY4xiGKUNiOBWCsIAhgIIQ+DJ?=
 =?us-ascii?q?wkWMRgNiA0XFYhPhV0jAzACBQaNZAEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 22 Jan 2020 14:07:08 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 00ME64kn169097; Wed, 22 Jan 2020 09:06:05 -0500
Subject: Re: [PATCH v5 01/10] capabilities: introduce CAP_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <0548c832-7f4b-dc4c-8883-3f2b6d351a08@linux.intel.com>
 <9b77124b-675d-5ac7-3741-edec575bd425@linux.intel.com>
 <64cab472-806e-38c4-fb26-0ffbee485367@tycho.nsa.gov>
 <05297eff-8e14-ccdf-55a4-870c64516de8@linux.intel.com>
 <CAADnVQK-JzK-GUk4KOozn4c1xr=7TiCpB9Fi0QDC9nE6iVn8iQ@mail.gmail.com>
 <537bdb28-c9e4-f44f-d665-25250065a6bb@linux.intel.com>
 <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <d7213569-9578-7201-6106-f5ebc95bd6be@tycho.nsa.gov>
Date: Wed, 22 Jan 2020 09:07:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <63d9700f-231d-7973-5307-3e56a48c54cb@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Song Liu <songliubraving@fb.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "james.bottomley@hansenpartnership.com"
 <james.bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Igor Lubashev <ilubashe@akamai.com>, James Morris <jmorris@namei.org>,
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

On 1/22/20 5:45 AM, Alexey Budankov wrote:
> 
> On 21.01.2020 21:27, Alexey Budankov wrote:
>>
>> On 21.01.2020 20:55, Alexei Starovoitov wrote:
>>> On Tue, Jan 21, 2020 at 9:31 AM Alexey Budankov
>>> <alexey.budankov@linux.intel.com> wrote:
>>>>
>>>>
>>>> On 21.01.2020 17:43, Stephen Smalley wrote:
>>>>> On 1/20/20 6:23 AM, Alexey Budankov wrote:
>>>>>>
>>>>>> Introduce CAP_PERFMON capability designed to secure system performance
>>>>>> monitoring and observability operations so that CAP_PERFMON would assist
>>>>>> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
>>>>>> and other performance monitoring and observability subsystems.
>>>>>>
>>>>>> CAP_PERFMON intends to harden system security and integrity during system
>>>>>> performance monitoring and observability operations by decreasing attack
>>>>>> surface that is available to a CAP_SYS_ADMIN privileged process [1].
>>>>>> Providing access to system performance monitoring and observability
>>>>>> operations under CAP_PERFMON capability singly, without the rest of
>>>>>> CAP_SYS_ADMIN credentials, excludes chances to misuse the credentials and
>>>>>> makes operation more secure.
>>>>>>
>>>>>> CAP_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
>>>>>> system performance monitoring and observability operations and balance
>>>>>> amount of CAP_SYS_ADMIN credentials following the recommendations in the
>>>>>> capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability is
>>>>>> overloaded; see Notes to kernel developers, below."
>>>>>>
>>>>>> Although the software running under CAP_PERFMON can not ensure avoidance
>>>>>> of related hardware issues, the software can still mitigate these issues
>>>>>> following the official embargoed hardware issues mitigation procedure [2].
>>>>>> The bugs in the software itself could be fixed following the standard
>>>>>> kernel development process [3] to maintain and harden security of system
>>>>>> performance monitoring and observability operations.
>>>>>>
>>>>>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>>>>> [2] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>>>>>> [3] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
>>>>>>
>>>>>> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
>>>>>> ---
>>>>>>    include/linux/capability.h          | 12 ++++++++++++
>>>>>>    include/uapi/linux/capability.h     |  8 +++++++-
>>>>>>    security/selinux/include/classmap.h |  4 ++--
>>>>>>    3 files changed, 21 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/capability.h b/include/linux/capability.h
>>>>>> index ecce0f43c73a..8784969d91e1 100644
>>>>>> --- a/include/linux/capability.h
>>>>>> +++ b/include/linux/capability.h
>>>>>> @@ -251,6 +251,18 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
>>>>>>    extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
>>>>>>    extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
>>>>>>    extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
>>>>>> +static inline bool perfmon_capable(void)
>>>>>> +{
>>>>>> +    struct user_namespace *ns = &init_user_ns;
>>>>>> +
>>>>>> +    if (ns_capable_noaudit(ns, CAP_PERFMON))
>>>>>> +        return ns_capable(ns, CAP_PERFMON);
>>>>>> +
>>>>>> +    if (ns_capable_noaudit(ns, CAP_SYS_ADMIN))
>>>>>> +        return ns_capable(ns, CAP_SYS_ADMIN);
>>>>>> +
>>>>>> +    return false;
>>>>>> +}
>>>>>
>>>>> Why _noaudit()?  Normally only used when a permission failure is non-fatal to the operation.  Otherwise, we want the audit message.
> 
> So far so good, I suggest using the simplest version for v6:
> 
> static inline bool perfmon_capable(void)
> {
> 	return capable(CAP_PERFMON) || capable(CAP_SYS_ADMIN);
> }
> 
> It keeps the implementation simple and readable. The implementation is more
> performant in the sense of calling the API - one capable() call for CAP_PERFMON
> privileged process.
> 
> Yes, it bloats audit log for CAP_SYS_ADMIN privileged and unprivileged processes,
> but this bloating also advertises and leverages using more secure CAP_PERFMON
> based approach to use perf_event_open system call.

I can live with that.  We just need to document that when you see both a 
CAP_PERFMON and a CAP_SYS_ADMIN audit message for a process, try only 
allowing CAP_PERFMON first and see if that resolves the issue.  We have 
a similar issue with CAP_DAC_READ_SEARCH versus CAP_DAC_OVERRIDE.
