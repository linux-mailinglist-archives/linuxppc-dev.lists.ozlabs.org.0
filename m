Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0806A18BD94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:07:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jtdM0r6rzDrPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.244; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0244.hostedemail.com
 [216.40.44.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jtZG5Yq7zDr3P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:05:08 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id B4C02100E7B42;
 Thu, 19 Mar 2020 17:05:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2691:2692:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3870:3871:3874:4321:5007:6120:6742:6743:7901:10004:10400:10848:11232:11657:11658:11914:12043:12297:12555:12740:12760:12895:12986:13069:13255:13311:13357:13439:14096:14097:14181:14659:14721:21080:21212:21451:21627:30054:30089:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:3, LUA_SUMMARY:none
X-HE-Tag: nail76_487c79fbbf85c
X-Filterd-Recvd-Size: 3720
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Thu, 19 Mar 2020 17:04:57 +0000 (UTC)
Message-ID: <9f8c9555e0c2a863b111654b4239c7ef0db06866.camel@perches.com>
Subject: Re: [PATCH v11 8/8] MAINTAINERS: perf: Add pattern that matches ppc
 perf to the perf entry.
From: Joe Perches <joe@perches.com>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 19 Mar 2020 10:03:07 -0700
In-Reply-To: <5cd926191175c4a4a85dc2246adc84bcfac21b1a.1584620202.git.msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <5cd926191175c4a4a85dc2246adc84bcfac21b1a.1584620202.git.msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-19 at 13:19 +0100, Michal Suchanek wrote:
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v10: new patch
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bc8dbe4fe4c9..329bf4a31412 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13088,6 +13088,8 @@ F:	arch/*/kernel/*/perf_event*.c
>  F:	arch/*/kernel/*/*/perf_event*.c
>  F:	arch/*/include/asm/perf_event.h
>  F:	arch/*/kernel/perf_callchain.c
> +F:	arch/*/perf/*
> +F:	arch/*/perf/*/*

While I understand the desire, I believe that
repetitive listings like this don't really
help much.

Having a single entry of:

F:	arch/*/perf/

would serve the same purpose.

Nominally, the difference between the 2 entries
vs the 1 entry is this:

F:	arch/*/perf/*

Only the specific files in any directory that matches
this pattern but not any files in their subdirectories
are maintained.

F:	arch/*/perf/*/*

Only the files in any top level subdirectory of any
directory that matches this pattern are maintained
but not files in any directory of those subdirectories.

F:	arch/*/perf/

Any file or any file in any subdirectory of any
directory that matches this pattern is maintained.


