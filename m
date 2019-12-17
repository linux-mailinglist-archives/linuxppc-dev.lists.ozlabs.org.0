Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115E122FC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 16:10:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47chQH3pYdzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 02:09:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.27.195;
 helo=updc19pa20.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.b="ozyiAI+z"; 
 dkim-atps=neutral
Received: from UPDC19PA20.eemsg.mail.mil (UPDC19PA20.eemsg.mail.mil
 [214.24.27.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47chMM0x86zDqWG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 02:07:26 +1100 (AEDT)
X-EEMSG-check-017: 39027479|UPDC19PA20_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="39027479"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by UPDC19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 17 Dec 2019 15:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1576594966; x=1608130966;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M8vVOKFL7M0o9dNSY+1QS9XWVSEgualJYa5ILUoa1w8=;
 b=ozyiAI+znvKptnDveIiXFZc5Cf77Vs4nbDYKTSMSd0Xu6CnIwzG1aGu/
 r87DxKj7MjtUw1yY18ORJi8UDyOaYa5fDv7VtnPcUtu1dHk7xrg3E8iZz
 MKlVlYMRi9RAQA5hfnUueDeUwG2TDcC0PyoOge+OPQleTVWZzXhJ1LCtu
 mClMndZVqhG/28Gl3wj0DF8DbDv+hGTssiROmvybA7ooy1XCb/BC5SNoC
 ra01Bthge0hRvQ7EQBv3VK0BdbJj4NSgEO4kK4dHCpQkB9ZI/cboI8fen
 K4xf5OArpXkD+S78jk+W4I1sG6MCRl4Bt75bSdR/aoTquVZoskyllAPcu w==;
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="31183820"
IronPort-PHdr: =?us-ascii?q?9a23=3A4JhWxRKuMEvgieyRbdmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgVLvjyrarrMEGX3/hxlliBBdydt6sfzbCO7Ou+CSQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Ngu6oRnTu8UZgIZvKbs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
 =?us-ascii?q?ZEWMteWTZBAoehZIURCeQPM/tTo43kq1cQqRayAA+hD/7txDBVnH/7xbA03f?=
 =?us-ascii?q?ovEQ/G3wIuEdwBv3vWo9rpO6kfSvy1wavSwDnfc/9b1zXw5Y7VeR4hu/GMWr?=
 =?us-ascii?q?dwfNLMx0kzCQzFllWQppLjPziIy+oNtnKU7+5kVe2xi28stgZ8oiOyycc3kY?=
 =?us-ascii?q?TJmoIUxUzE9SV+2oo1I8a4R1Rhbd6rF5tQqTiXOo1rSc0sRGFovTw1yrwAuZ?=
 =?us-ascii?q?OjeSgF0pInyhzFZ/yAaYiI7RTuX/uSLzdgnH9pZb2yihmo/UWg1+HwTNe43V?=
 =?us-ascii?q?lUoiZfj9XBsG0G2QbJ5cidUPR9+1+s2TOI1w/O9O5JOVs0la/HK545xb4wi4?=
 =?us-ascii?q?YTvVzDHiDonEX2i7ebdlk+9eiy6uTnf67mqoWdN49yhAH+Nb8uldKjDugiLg?=
 =?us-ascii?q?gPX3SU+eS71LH5+032XK5KgeEsnqncsZDaIdwXpq+/AwBLzoYu8wuzAjip3d?=
 =?us-ascii?q?gCnXQLMUhJdAyIgoT3IV3CPej0DfKljFStlDdryerGPrrkApjVNXjMjazhcK?=
 =?us-ascii?q?1h609c1AUzzddf64hSCrEaOv3/QEDxtNvGDhMhKQy73/7nCMlh1oMZQW+AGK?=
 =?us-ascii?q?uZP73dsFCW5uMjOfKDZJIItznnLfgl5PnujWEilF8ZfKmp24YXaX+iEvRnJU?=
 =?us-ascii?q?WZfWTjgtMbHWgWuQo+SfTgiEeeXj5Le3ayQ6U86ykjCI24EYfMWJqtgb2a0S?=
 =?us-ascii?q?e6GJ1WaHpGBUqRHnj2bYqLRu0AaCWIIs9uijYET6SuS5c91RGysw/306BoIf?=
 =?us-ascii?q?bR+iIGrp/j18Z65/fVlR4s8Tx4FcOd03uCT2tshGMHWyc23LxjoUx60lqD1K?=
 =?us-ascii?q?l4g/pXFdxU/P5JSBk1OoPcz+NgF9D+QB7OftCMSFy+WNWpHSkxTs4tw98Je0?=
 =?us-ascii?q?t9Gc+tjhbC3yawBb8Vlr+LBIEw8q3GxHXxI8d9y3Db1KgulVUmQ81PNXG4ia?=
 =?us-ascii?q?577QTcG4nJk0CBnaawaascxDLN9HuEzWeWvkFYVwlwUaPfUnAEfEfWqc725k?=
 =?us-ascii?q?PeT7+vD7QoLA1BxNWGKqtLbN3pkFpHSO3iONTYf2K+hWOwCQyUybOLaYrgY3?=
 =?us-ascii?q?8d0znFCEgYjwAT+m6LNRI5Bii8uWLeDTNuFVX1b0Py8Ol+tnK7Q1Q1zwGMc0?=
 =?us-ascii?q?1uyb619gQJivybTvMZxqgEtzs5qzVoAFa92MrbBMCbpwp9Z6hcYs0y4E1B1W?=
 =?us-ascii?q?3HswxxJJugL7pthlQGaQR4o1vu1wlrCoVHicUlt20lzAxyKa+D01NOaSmY3Z?=
 =?us-ascii?q?buNb3TMGX94AqvZLTN2lHe0daW/KgP5O4/q1X5swGjDlAi/Gl/09lJz3uc4Y?=
 =?us-ascii?q?3HDBIIXpLsVkY36gN6qqrBYiYn4oPbzmdjPbOzsj/Y1NIjHPElxQq4f9dDLK?=
 =?us-ascii?q?OEExf/E8gCB8ewM+ElhVypbhYaM+BI8a47JcWme+GH2KG2Jupvhi+mh3xd4I?=
 =?us-ascii?q?9hykKM6zZ8SunQ0pYe3f6YxASHWCnngVehqM/3nYREZDEUHmal1SfkA4tRbL?=
 =?us-ascii?q?VofYkXEWeuP9G3xtJmip7vXn5Y80SjB0kH2M+yYheSaUby3QhO2kQWu3Cnnj?=
 =?us-ascii?q?G4zzNsmTEzsqWfxDDOw/jldBcfJmFEXnJigknsIIWvlNAVQEioYBI0lBur4U?=
 =?us-ascii?q?b12bJbqL1jIGbJW0tHYy/2L2R6WKuqqrWCe9JP6I8vsShPUuS8ZlSaSqXnrB?=
 =?us-ascii?q?YBySPsAXZRxDAheDG2oJn2gxt6iGeFJnZpsHXZYd1wxQvY5NHEX/FR3SELRC?=
 =?us-ascii?q?15iTnRG1i9MMOl/dSSl5ffrO++U3itWYFUcSnu1YmArje05XV2AR2jmPC+gs?=
 =?us-ascii?q?PoERIg3i/91tllTyPIoQ3zYons0KS6PuZncVdyCFDg7Mp6H5l0kpEsi5EIxX?=
 =?us-ascii?q?gampKV8GIGkWf3LNVUwrjxbGENRTEV2NPa+gvl11dmLn2TxoL1TGmSwsxkZ9?=
 =?us-ascii?q?OieGMZxjo979xWCKeT9LFLhy91rUS3rA3LZ/hygykSyeE05H4Bg+EJuREtzi?=
 =?us-ascii?q?WeArATG0lVJijslxWO79Cjo6Rbfmevcb6s1EVgmdCtFq2NogZZWHzhYJctAT?=
 =?us-ascii?q?dw7tljMFLLyHDz7JvreNzQbdMTqx2UlRjAgvNWKJ0vjPoKgzRoOWbnsX0i0e?=
 =?us-ascii?q?47ggRk3Yums4ifN2Vt4KW5DwZbNjLrecwT4S3ijaFZnsaVxI2gApVhGi8MXJ?=
 =?us-ascii?q?vtTPKoDTcSue7gNwaUHz02sm2bFqbHHQ+D9EdmqGrCE5KxOHGRInkZzc5vRB?=
 =?us-ascii?q?aaJExYjwAUWCs1koQlGQCtwczraF156SwJ5l7kthtMzfplNwXwUmfbqwalcT?=
 =?us-ascii?q?M0SJmZLBpL8gFC/UDVMcqf7uN8BS1X44OuphSXKmOHfwRIEX0JWkucClD/IL?=
 =?us-ascii?q?mu/8XA8+ufBuakMvvOe66OqfFaV/eJw5KiyY9m/zeKNsWSMXhuFfw72kxfXX?=
 =?us-ascii?q?9nH8TVgSkASysSlyjVdc6UuA+8+jFrrsC46PnrXAPv5Y2SC7pdKNlv4A65jr?=
 =?us-ascii?q?ueN+6KhSZ5NTZZ2ooJxX/P1bcfwVoShD91ejmzHrQPqzTNQLjTmqBJFR4bbT?=
 =?us-ascii?q?18NM9S46I7xAlNNtbRisnp2b5gkv41F1BFWET6ms63YcwKIme9NE7IBUuQKr?=
 =?us-ascii?q?SGKiPEw9vtbaO/V7JQluNUuAO0uTqBFE/jJDuDnSHzVx+zKeFMkD2bPBtGtY?=
 =?us-ascii?q?G5cxZtD3XjTd3/Zh24LtB3lzs2zqMwhn7RK24cPiZzc1lXor2T8yxYmPN/FH?=
 =?us-ascii?q?JF7nZ/KumEgSmZ5fHCKpkKqftrHjh0l+VC7XQ+yrtV6jxERfNslCvKsNFuuV?=
 =?us-ascii?q?+mnvCSyjp8ThVOsC1LiZmVvUVtJ6rZ7INMWXXa8xIX62WfFRAKq8FiCt31tK?=
 =?us-ascii?q?Ba0sLPm77rKDde79LU+tMRB8nSKMKbLnUhNQPlGDHaDAoKVjOrMWDfh1dBkP?=
 =?us-ascii?q?GJ7HGVoII6pYbyl5UTVLBbT181Fu8dCkR9BtACJ413Xjw8m76BkMEI/Wa+rA?=
 =?us-ascii?q?XWRMhCpZ/HWeiSDuvgKDaWlrREYQUHwa/2LYQXN4361FZuZUV9nITPA0DQR8?=
 =?us-ascii?q?xCojV9bg8op0VA6GN+Tmo120LqbgOt4WITGuWunhEslAt+YOIt9Dj37lc5PV?=
 =?us-ascii?q?XGvjc/kE40md/9mzCebCbxLLusXYFREyf7rFAxMp3gTgZrYg29g1ZkOC3HR7?=
 =?us-ascii?q?1Plbtgc35kiAvGtZtIA/5cQrVOYAUMyvGPe/UozVNcpz2jxU9G4+vFFJRjmB?=
 =?us-ascii?q?IycZG2tXJA2hljY8IuKKzOK6pG0EJQiriNviC2zOAxxhERJ0IX/GOVYi4It1?=
 =?us-ascii?q?QCNqM6KCqw4uxs9QuCliNHeGgNUfoqv/1r9lslO+uc1i7vzqBMKl6qOuybLq?=
 =?us-ascii?q?OZoHTAldWSTlM310IIk1NK8qNt0cs5dEqUTU8vn/OtEEEgMcfSJBAdRdde/X?=
 =?us-ascii?q?7QejjG5ezJzIJ4LsO3C+zhS+yJqo4Qg0S5DEAoGZgB6oIKGZz6lAngINvqNv?=
 =?us-ascii?q?Y3yBcp/xjxLR3RFPlVdQiZuDYBrdu2wJJ+0c9aPD5LRS1UKyO+4rrQ7iQjmu?=
 =?us-ascii?q?SKWNcxKnsXFq4JMnV+DMSxniNxvHlaCjSzlOUDx17Gpx76qSOYKT74adN5LK?=
 =?us-ascii?q?ORZBVjD/ms9Dk/+rTwglnSpNGWbWPzM9UkvN7M9OcTj5KGDe5EC7h7r0rY3Y?=
 =?us-ascii?q?JfQjbiB2zGF9/zIZnzdo0lRdj1DGuqFF25lz8xCcz2OYDpZuKKhgbuTJ0StI?=
 =?us-ascii?q?CbwDElOMmVEjAYBgc2pucf6aY6bgoGKdJvYxnvsQ0lcai2IBuZ1Nioa2KsLy?=
 =?us-ascii?q?ZGCfhZ0ei+IbdQynxoJqWgz3c6T549ife2708lRZcWgxWYzvGmLcEKSy//AH?=
 =?us-ascii?q?1SfEPRpDQ4v2lnKus2hOw4xUWM+XAYPiCGdaRSdGVeuM87BE+VPz0iA3Ekb1?=
 =?us-ascii?q?yRl4zO5kirxb9Eu2N3ktBW2OhEtjDes4XFbTS3U6yuqJnJ+34qYN4mi658K4?=
 =?us-ascii?q?ruJo2NrprFnj3ZQ9/XqALTFGaCHude0v1ZKyFVWuNBgilxIcUbvZdawVE4U8?=
 =?us-ascii?q?03YbtVB/9o7pWrYjptACpa4CsdWpmF1TpK1uKk1pPXkhOdapErNloFvNNLn4?=
 =?us-ascii?q?1ZGxV7eCwT7I+qU4HHkSfQUWURLwo77Q1I4BMG0IR3e7ahqKjBSZJXgxtRue?=
 =?us-ascii?q?h1SWOfFJxv7UH6UUmQiF31SbOmieP/mUp5xenhw5EgUx52FEZZyvwewkAhM7?=
 =?us-ascii?q?xmA7IbvofXvDuFbwbxtSTmz+7wd3dLzsiBTEH1FIrIsyLHVyQY/XAFDdtUxG?=
 =?us-ascii?q?r3CYUZkw0/br0i4lpLPtb1KQ7F+zU4ytExTPGDXsexygNg9CxXSg=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2BKAACQ7Phd/wHyM5BlHAEBAQEBBwEBEQEEBAEBgWwFA?=
 =?us-ascii?q?QELAYFzgRhVIBIqhASJA4ZzBAaBN4lqj0qBewkBAQEBAQEBAQErDAEBhEACg?=
 =?us-ascii?q?jw2Bw4CEAEBAQQBAQEBAQUDAQFshTcMgjspAYJ6AQUOFRUtFBALGAICJgICV?=
 =?us-ascii?q?wYBDAYCAQGCXz8BglIlD64agTKEDQEBgUCDQIFIgQ4oAYlOgmN5gQeBOA+CX?=
 =?us-ascii?q?T6CZAOEcoJeBI94hxRGlzOCPoJChG2OWwYbgkN0hwKQEC2OIIFGhwqTfgUtg?=
 =?us-ascii?q?VgrCAIYCCEPgycJFjERFI1KiE+FCAFUIwMwAZF/AQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 17 Dec 2019 15:02:44 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 xBHF1mb0066955; Tue, 17 Dec 2019 10:01:51 -0500
Subject: Re: [PATCH v3 1/7] capabilities: introduce CAP_SYS_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Serge Hallyn <serge@hallyn.com>,
 James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>
References: <b175f283-d256-e37e-f447-6ba4ab4f3d3a@linux.intel.com>
 <bd8adfde-f562-0e56-75aa-371c5354f350@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <a9542dcd-6f02-92eb-bd97-8aa839e9036f@tycho.nsa.gov>
Date: Tue, 17 Dec 2019 10:02:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bd8adfde-f562-0e56-75aa-371c5354f350@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, songliubraving@fb.com,
 Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Jann Horn <jannh@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 intel-gfx@lists.freedesktop.org, Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Brendan Gregg <bgregg@netflix.com>,
 Jiri Olsa <jolsa@redhat.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/16/19 2:58 PM, Alexey Budankov wrote:
> 
> Introduce CAP_SYS_PERFMON capability devoted to secure system performance
> monitoring and observability so that CAP_SYS_PERFMON would assist
> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
> and other subsystems of the kernel.
> 
> CAP_SYS_PERFMON intends to harden system security and integrity during
> system performance monitoring and observability by decreasing attack surface
> that is available to CAP_SYS_ADMIN privileged processes.
> 
> CAP_SYS_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
> system performance monitoring and observability and balance amount of
> CAP_SYS_ADMIN credentials in accordance with the recommendations provided
> in the man page for CAP_SYS_ADMIN [1]: "Note: this capability is overloaded;
> see Notes to kernel developers, below."
> 
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>
> ---
>   include/linux/capability.h          | 1 +
>   include/uapi/linux/capability.h     | 8 +++++++-
>   security/selinux/include/classmap.h | 4 ++--
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/capability.h b/include/linux/capability.h
> index ecce0f43c73a..6342502c4c2a 100644
> --- a/include/linux/capability.h
> +++ b/include/linux/capability.h
> @@ -251,6 +251,7 @@ extern bool privileged_wrt_inode_uidgid(struct user_namespace *ns, const struct
>   extern bool capable_wrt_inode_uidgid(const struct inode *inode, int cap);
>   extern bool file_ns_capable(const struct file *file, struct user_namespace *ns, int cap);
>   extern bool ptracer_capable(struct task_struct *tsk, struct user_namespace *ns);
> +#define perfmon_capable() (capable(CAP_SYS_PERFMON) || capable(CAP_SYS_ADMIN))

I think making it a static inline bool function instead of a macro would 
be preferred?

Otherwise,
Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

>   
>   /* audit system wants to get cap info from files as well */
>   extern int get_vfs_caps_from_disk(const struct dentry *dentry, struct cpu_vfs_cap_data *cpu_caps);
> diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> index 240fdb9a60f6..98e03cc76c7c 100644
> --- a/include/uapi/linux/capability.h
> +++ b/include/uapi/linux/capability.h
> @@ -366,8 +366,14 @@ struct vfs_ns_cap_data {
>   
>   #define CAP_AUDIT_READ		37
>   
> +/*
> + * Allow system performance and observability privileged operations
> + * using perf_events, i915_perf and other kernel subsystems
> + */
> +
> +#define CAP_SYS_PERFMON		38
>   
> -#define CAP_LAST_CAP         CAP_AUDIT_READ
> +#define CAP_LAST_CAP         CAP_SYS_PERFMON
>   
>   #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
>   
> diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
> index 7db24855e12d..bae602c623b0 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -27,9 +27,9 @@
>   	    "audit_control", "setfcap"
>   
>   #define COMMON_CAP2_PERMS  "mac_override", "mac_admin", "syslog", \
> -		"wake_alarm", "block_suspend", "audit_read"
> +		"wake_alarm", "block_suspend", "audit_read", "sys_perfmon"
>   
> -#if CAP_LAST_CAP > CAP_AUDIT_READ
> +#if CAP_LAST_CAP > CAP_SYS_PERFMON
>   #error New capability defined, please update COMMON_CAP2_PERMS.
>   #endif
>   
> 

