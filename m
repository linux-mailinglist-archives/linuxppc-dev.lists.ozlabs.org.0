Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE8121A04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 20:35:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cBLd5p2yzDqRb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:35:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tycho.nsa.gov (client-ip=214.24.27.197;
 helo=updc19pa22.eemsg.mail.mil; envelope-from=sds@tycho.nsa.gov;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=tycho.nsa.gov
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=tycho.nsa.gov header.i=@tycho.nsa.gov header.b="KTXqUe8s"; 
 dkim-atps=neutral
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Tue, 17 Dec 2019 01:05:35 AEDT
Received: from UPDC19PA22.eemsg.mail.mil (UPDC19PA22.eemsg.mail.mil
 [214.24.27.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c32R51tszDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 01:05:35 +1100 (AEDT)
X-EEMSG-check-017: 38532227|UPDC19PA22_ESA_OUT04.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; d="scan'208";a="38532227"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UPDC19PA22.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 16 Dec 2019 14:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1576505050; x=1608041050;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=U0M0tIssvGrXXr9dmiqb0cmH1xoVvn8V0R69uhizAz0=;
 b=KTXqUe8sb2PaSUXJCKpMxB2Hk73Yo9j9pfxTl1cKuwrrGo+O8uStQqKp
 TjYYnBYoXCSHS8417ilrU/MyiePCCwotzWd2Wvn6sDPW2N+cEHnKGALj9
 X7IXtccAlgBO3OiRZ4PlOiH8NbPgxWx4ARYfWuhKuxmP2mxlr1YAbRM4Q
 OajViEDHerxF3j3n0qZhcRniCN3JLovqtio+AGMUzHUXYa3Z1POVGhVAs
 mbC5/DsB/ugFsF87f3SYMgc3IWfwkFvePpM8iGWmNFAgtsE+H0Ajdsnvo
 5kTSsusgZs/dnlL4iwi5WuAgl3CEe0XIht9nempVwrwbqzqLro2LeYe3x g==;
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; d="scan'208";a="36782375"
IronPort-PHdr: =?us-ascii?q?9a23=3AKPoiuhHc+V4kn8xeMmMs4J1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ74pcqzbnLW6fgltlLVR4KTs6sC17ON9fq4BCddsN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6txvdutUWjIdtKqs8zg?=
 =?us-ascii?q?bCr2dVdehR2W5mP0+YkQzm5se38p5j8iBQtOwk+sVdT6j0fLk2QKJBAjg+PG?=
 =?us-ascii?q?87+MPktR/YTQuS/XQcSXkZkgBJAwfe8h73WIr6vzbguep83CmaOtD2TawxVD?=
 =?us-ascii?q?+/4apnVAPkhSEaPDMi7mrZltJ/g75aoBK5phxw3YjUYJ2ONPFjeq/RZM4WSX?=
 =?us-ascii?q?ZdUspUUSFODJm8b48SBOQfO+hWoZT2q18XoRegAQSgAeXiwSJKiHDrx603y/?=
 =?us-ascii?q?kvHx/I3AIgHNwAvnrbo9r3O6gOXu6417XIwDfZYv9KxTvw5orFfxY8qv+MR7?=
 =?us-ascii?q?Jwds/RxFEyGQPZkFqQsYzlMC2T1u8Qrmab6vBvVeari2E5qwB6vz+ixtwxhY?=
 =?us-ascii?q?nSnY8V1lDF+jl5wIYyP9G4TlV7bsS+HJtfsCGaKZJ7T8U/SG9mvyY6z6cJuZ?=
 =?us-ascii?q?+9fCUSzZQo3RjfZv6df4iP+BLjW+CcKip7inJ9YL+zmhm//Ee6xuD8S8W4yk?=
 =?us-ascii?q?hGoyVbntXWq3wA0QHY5NKdRftn5Eih3C6C1wXU6u5ZP085jbHbK5s9wr4okZ?=
 =?us-ascii?q?oTrFjDEjf2mEroiK+WcV0p+vSy5OT9Y7Xmu4ScO5V1igH4PKQunde/DvokPQ?=
 =?us-ascii?q?QUQ2ia+fiz1L3k/UHjRrVFkuY2nbXDvJDfJMQbora1Aw5T0ok99xayFyqq3d?=
 =?us-ascii?q?sXkHUdLF9JZQiLg5bmNl3QOvz0EO+zg1G2nzdqw/DGMKfhApLILnXbi7fuYK?=
 =?us-ascii?q?195lVAyAsz0d9f55VUBqsHIPLoQED9rtPYDhgnMwCs2eboFM191p8CWWKIGq?=
 =?us-ascii?q?KWKqfSvkGH5+0xI+iAfpQauCvgJPc/4f7ujng5mUEGcKmt3JsXbm24H/t8L0?=
 =?us-ascii?q?WYZ3rsnskOEWMQsgUiS+zqjUWIUSRPaHaqQ6I8+jY7BZq+DYjdWoCinqaB3S?=
 =?us-ascii?q?agE51XYGBGBEqMHm31eIqaQfgDdTieIsh7kjwLTbKhUZMu1QmytA/mzLpqNv?=
 =?us-ascii?q?Db9TEdtZ39z9V15PPclQs09TNqC8SRyWaNT3t7nmkQXT85wLh/oVBhyleEya?=
 =?us-ascii?q?V4hv1YFdpc5/NOSQo6L4DTwPF6C9/oRgLNZMuGSFGjQt++GzE+Usoxw8MSY0?=
 =?us-ascii?q?Z6A9iijArM3yyrA7MPkbyLBZ808r/Y33frPMt9z3fG1K88j1gpWMdPNGumhr?=
 =?us-ascii?q?Jh+AjXHYLGj0KZl6Oyf6QGwCHN7HuDzXaJvExAUg5wVqLFXXYFaUvNt9j54l?=
 =?us-ascii?q?nNT7+yCbQmNAtO18iCJ7BOat3oi1VGWfjiNM7fY2K3h2e/GxKIyqmQY4rtfm?=
 =?us-ascii?q?UXxD/dB1QckwAP4XaGMhAzBj2mo23DFjxuFF3vY0T2/elgqXO7UE40whqLb0?=
 =?us-ascii?q?1ny7q65BoVieaARPMU27IOoD0hpClsHFahw9LWDMKNqBB6fKVAet4940lI1X?=
 =?us-ascii?q?jftwNjOpysNadihkQRcw5vpUPhyw13CplckcgttH4qzhB9KaeG31NabT+Xxp?=
 =?us-ascii?q?fwOqHLKmn1+RCvb7DZ21HF3daW4KgP7u84pEvlvAGxDEUi6Wln099L3HuG/Z?=
 =?us-ascii?q?XKDAsSUYrrXkkr8Bh6oqnQYjMh6IPMyX1sLa60vyfZ1N03Auslyg2tf9RBP6?=
 =?us-ascii?q?OeEg/9DckaC9KyJ+wwgVepdRIEPOFU9K47Jc+mcOGG2KGzNuZ6gD2mlXhH4J?=
 =?us-ascii?q?x60k+U6yVzUPXI0IgFwvyDxQuISzf8g028ssD5nYBLeysSEnOjxif+HoJeeq?=
 =?us-ascii?q?pyfYMTA2e0P8K33sl+h4LqW3NA716sGUkG2MC3dheJb1zyxwlQ1UAXoHyhgy?=
 =?us-ascii?q?e30zt0kzQxpKqFwCPO2/jidAYAOmNTRmliiFDsIZKuj9AbR0ildA4pmwGg5U?=
 =?us-ascii?q?nkxqhXvqN/L3PcQU1QZSj5M3liUrestrqFe8NP6pQosSFMUOumel2aUKDyrA?=
 =?us-ascii?q?Ya0yz5A2tS3iw0dzavup/hhRx1lHqdLGpvrHreYcx/3xTf6cfYRf5Q2DoGWS?=
 =?us-ascii?q?Z5hSPWBli6I9mm49GUm43fveC5UmKrTodTfjXzzYOcqCu74nVnDgOln/+pnN?=
 =?us-ascii?q?3nEBI10Sng2tllUiXIqxn8Yo312KigLe1neUxoDkfm68VmAoF+jpcwhJYI1H?=
 =?us-ascii?q?gbgpWV4GEInn3oMdVbx63zd2ACRT0RzN7Q+gfl2VdvIW6Ox4L8Tn+d2NduZ8?=
 =?us-ascii?q?GmYmMK3SIw99pFCKOK471LhyR1pEe3ohzLYfRnhTcdyfou6GUag+EKuQotyD?=
 =?us-ascii?q?6QArQTHUleICztmA6E79G4rKVLemmvdaK821Z5ndCkFLuCuB1TWG7lepc+Gi?=
 =?us-ascii?q?999sN/P0jJ0H3z6oDkZd/Qbd0Iux2XjRjAle5VJ4w1lvYQgipnI239t2U/y+?=
 =?us-ascii?q?EnlRxuwY26vI+fJmVv5q25BBhYNj3uasMc/THtiqlensKI0Iy1ApphHTALVo?=
 =?us-ascii?q?PyTf20CDISqejnNwGWHT0/tHiUB6HfEhOY6EdhrHLCCIykN3GNJHkeyNViRQ?=
 =?us-ascii?q?SdJElFjAATRjU6kYYzFhq2y8z5bEd5+jcR60bkqhtDzuJpOALyUmPepAeudz?=
 =?us-ascii?q?c0VIKfLB1Q7gFD6EbZK9GR4fxrFSFC4pKhtBCNKnCcZwlQEWEJRFaEB0zgPr?=
 =?us-ascii?q?mp/9XA7vKYBvGjL/vKYLWOr/dTV/OJxZKpz4tn8CyANsSJPnl+EfI73lBPUm?=
 =?us-ascii?q?x+G8Tcgz8PUTAYlzrRb86Hoxex4il3rsG58PT2VwPj/JCPBKVOPtVy4RC2gL?=
 =?us-ascii?q?uDNu6JiCZ8LjZXy44MxXvWx7UEwl4ShD9hdyO3HbQDqyHNVqTQlbFTDxIBbC?=
 =?us-ascii?q?NzLsRI5bom3gZRIc7bls/11rlgg/4uFVhFUV3hmse0Zc0FOGy9KlzHC1iRNL?=
 =?us-ascii?q?icJj3E3dv3YaWiRr1UlulUsAewuTmDGU/5IjuDjyXpVwyoMexUiCGbPRpeuJ?=
 =?us-ascii?q?yycxp0CmjsUsjmahulP99zljA237I0iW3QNWIGMjhzbVlNrruO4iNcmPl/HH?=
 =?us-ascii?q?ZB7nV9J+mehymZ9/XYKooRsfZzBiR0luRa4Gk1yrdM9CFLWuZ1mCXLot5zuF?=
 =?us-ascii?q?GpjPOPyiF8XRpQpTZEmpiLsV9hOarH7JlAX2jL/BYX4WWXERQKqMNvCsfztK?=
 =?us-ascii?q?BI1tjPiKXzJS9D89LS4csTGczUJNuIMHovPhvkAzrUDAoeTT63LmHTnUJdkO?=
 =?us-ascii?q?uM+XKLs5c1tIPsmJkSSr9cTFw5DPQaCl5qHNYaOpd4QiskkaKHjM4P/Xextx?=
 =?us-ascii?q?bRRN9EsZDIWfKfGvPvJyiFjblKYxsIwLz5IZ4POY383kxockN6k5jSG0rMQd?=
 =?us-ascii?q?BNpTVsbhQzoEVL/3h+Smwz21/+ZQO3+nATC/+0nhg5igZlb+Qi7y3g7EswJl?=
 =?us-ascii?q?rPvCEwilU+mc35gTCNdz78NLy/XZlYCyfvqUgxPY30QxxvYQ2xg0NkLjHESK?=
 =?us-ascii?q?xVj7d6cmBrkgDcs4NVGfFAVa1EfAMQxfaPavUs0FRcrDinxEBe6evdE5Rijg?=
 =?us-ascii?q?oqcYWwoH9bxQJjY8A6JbbKKKpK0FdQnKSOsTGs1uwrxw8ePUkN+nuIeCEUoE?=
 =?us-ascii?q?wIKqUmJy2w8+xo6AyCnSZDeWcUV/oyvv1m714yNPqezy/7175DK1uxN/CEL6?=
 =?us-ascii?q?+DvGjBlMqITUkr2UMTjUVF+qJ20chwO3aTAmkrwaucBlwjKMbLLwJScYIG/X?=
 =?us-ascii?q?zebSuf9+/QzZtzPIKjPuTpS/Ke8qcSnk+gWg0uGtJIpvwMApS2mHPZL8P8MK?=
 =?us-ascii?q?QMgUE16RjmPketDfJHYhuHnT4L5calw8kzlaBHIDgZDWI1Giyt+L/TpghijP?=
 =?us-ascii?q?fLedoyZT9OV4ABO1o1Vde8liofuG5PWn3/8+QWz0Cn6Dv6rz6YWDz9adVkTO?=
 =?us-ascii?q?2ZaRNlFJe9/jBpt+C0gFjWtJPfJHz+PPxmu9nS+aUboYqKD7VfSrw5+0XbnI?=
 =?us-ascii?q?9RXDquWm7TENi4IbD0ao8xfZr1DGq3Vhq0jDdxB932MMysIa/OnwD2RK5Vtp?=
 =?us-ascii?q?WW2HYoMsr5XhgaFgd9pqk4+KtmYhMEYoY8f1a8vh8iH6+yOgGV1pOpWWn7bX?=
 =?us-ascii?q?NURvxS1qOwYKBLyC8oY/6SyHImVZw81+Ct7UgAXooKjwmYzvGmI8FUXC7zMn?=
 =?us-ascii?q?9QYQPCoWwyjWF6Nuc0zaE42hyM+XIVKD2aPNdiaGVZsdUxHxvGKnxtB3sQXF?=
 =?us-ascii?q?SchJfN5gO2mrsbuSBamoAQmfZIqnfzlp/WZDa9XuqgrpCR+wgpaNU964h2K5?=
 =?us-ascii?q?biOYPStpbZhCbeV7HWuwiIUWi9DfUMyfZKJycNe+VFgWEoP4Q9vINF7UcgHp?=
 =?us-ascii?q?MlK6dnFLgnprfsbyFtSyEV03lKBMu7wDUej7LkiPPhnRCKfcFnaUZVvQ=3D?=
 =?us-ascii?q?=3D?=
X-IPAS-Result: =?us-ascii?q?A2CjAgCTjfdd/wHyM5BlHAEBAQEBBwEBEQEEBAEBgX6Bd?=
 =?us-ascii?q?IEYVSASKoQEiQOGdgaBEiWJapFFCQEBAQEBAQEBASsMAQGEQAKCODgTAhABA?=
 =?us-ascii?q?QEEAQEBAQEFAwEBbIU3DII7KQGCegEFDhUVLRQQCxgCAiYCAlcGAQwGAgEBg?=
 =?us-ascii?q?l8/AYJSJQ+uCYEyhA0BgUGDOIFIgQ4oiU+CY3mBB4E4DAOCXT6CZAOEcoJeB?=
 =?us-ascii?q?I92hxNGlyuCPoI/hGqOVgYCGYJDdIcCkA8tjh+BRocJlAsigVgrCAIYCCEPg?=
 =?us-ascii?q?ycJFjERFI1KiE+FCFUjAzABkCUBAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 16 Dec 2019 14:04:07 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 xBGE37n2143708; Mon, 16 Dec 2019 09:03:09 -0500
Subject: Re: [PATCH v2 1/7] capabilities: introduce CAP_SYS_PERFMON to kernel
 and user space
To: Alexey Budankov <alexey.budankov@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 Alexei Starovoitov <ast@kernel.org>,
 james.bottomley@hansenpartnership.com, benh@kernel.crashing.org,
 Casey Schaufler <casey@schaufler-ca.com>, serge@hallyn.com,
 James Morris <jmorris@namei.org>
References: <26101427-c0a3-db9f-39e9-9e5f4ddd009c@linux.intel.com>
 <9066ae10-63d6-67a1-d472-1f22826c9ae8@linux.intel.com>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <81603537-023c-9b6b-06ac-384de60dbb1d@tycho.nsa.gov>
Date: Mon, 16 Dec 2019 09:04:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9066ae10-63d6-67a1-d472-1f22826c9ae8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 Dec 2019 06:30:54 +1100
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Song Liu <songliubraving@fb.com>, Andi Kleen <ak@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, linux-parisc@vger.kernel.org,
 Jann Horn <jannh@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, intel-gfx@lists.freedesktop.org,
 Igor Lubashev <ilubashe@akamai.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 bgregg@netflix.com, Jiri Olsa <jolsa@redhat.com>, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/16/19 2:14 AM, Alexey Budankov wrote:
> 
> Introduce CAP_SYS_PERFMON capability devoted to secure system performance
> monitoring and observability operations so that CAP_SYS_PERFMON would assist
> CAP_SYS_ADMIN capability in its governing role for perf_events, i915_perf
> and other performance monitoring and observability subsystems of the kernel.
> 
> CAP_SYS_PERFMON intends to harden system security and integrity during
> system performance monitoring and observability operations by decreasing
> attack surface that is available to CAP_SYS_ADMIN privileged processes.
> 
> CAP_SYS_PERFMON intends to take over CAP_SYS_ADMIN credentials related to
> system performance monitoring and observability operations and balance amount
> of CAP_SYS_ADMIN credentials following with the recommendations provided
> in the capabilities man page [1] for CAP_SYS_ADMIN: "Note: this capability
> is overloaded; see Notes to kernel developers, below."
> 
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
> 
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>

> ---
>   include/uapi/linux/capability.h     | 8 +++++++-
>   security/selinux/include/classmap.h | 4 ++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
> index 240fdb9a60f6..7d1f8606c3e6 100644
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

