Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CDC806FB1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 13:29:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOytNp2p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlcD34BHHz3cbw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:29:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOytNp2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlcCD1vT3z3bws
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 23:28:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3264B61C7A;
	Wed,  6 Dec 2023 12:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC65EC433C9;
	Wed,  6 Dec 2023 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701865731;
	bh=VVk9kQHEnMbycIorFX5k/DX3qnjW1iukn5lB2/0YVs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOytNp2pZ2rZJLw6dK5rXdIrQhEzaHpr+XF9wzgaQqHr5c5BSn4qIx9AGigGG/SAW
	 rhkdsHbG0VuLLxAAXluNxhBIXaDL9K3bpW6WuU0HeZCyc1eqt6RwLazz3DeuQxJbUp
	 l8B3WEt2VHB85qPA74XPWLu282GrRJG9e3i6reciz56ID0Y2EJ8XHpE2qbhI8Uq57x
	 Vft0/dU5Qdwg1puSiNKnKqtUGAt4wmKkceR9LZyG09EHchRG3GAD25+Elcn7tuqX5X
	 uVWq4lxgM3SQ5riluNHzOb6OuKSqcYuHkIlgBEg31CoOSvYrtxBMajkzlLLWbf3lum
	 2OSeloi0QGNQg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 2C7764041A; Wed,  6 Dec 2023 09:28:49 -0300 (-03)
Date: Wed, 6 Dec 2023 09:28:49 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Message-ID: <ZXBpARnqcRmlRG6N@kernel.org>
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
 <ZW+bIGC3r2dcTQUO@kernel.org>
 <CAP-5=fVAYnYd7yAQMRdQFoHyDK9SAd1jS6Tjh8QhOSU3Cymk_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVAYnYd7yAQMRdQFoHyDK9SAd1jS6Tjh8QhOSU3Cymk_w@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, James Clark <james.clark@arm.com>, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Dec 05, 2023 at 02:09:01PM -0800, Ian Rogers escreveu:
> On Tue, Dec 5, 2023 at 1:50 PM Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >
> > Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
> > > On 23/11/2023 16:02, Athira Rajeev wrote:
> > > > --- a/tools/perf/Makefile.perf
> > > > @@ -1134,6 +1152,7 @@ bpf-skel-clean:
> > > >     $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
> > > >
> > > >  clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
> > > > +   $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> > > >     $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
> > > >     $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
> > > >     $(Q)$(RM) $(OUTPUT).config-detected
> >
> > While merging perf-tools-next with torvalds/master I noticed that maybe
> > we better have the above added line as:
> >
> > +   $(call QUIET_CLEAN, tests) $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> >
> > No?
> >
> > Anyway I'm merging as-is, but it just hit my eye while merging,
> >
> > - Arnaldo
> 
> Makefile.tests was removed in these recent patches adding support for
> the OUTPUT directory:
> https://lore.kernel.org/lkml/9C33887F-8A88-4973-8593-7936E36AFCE1@linux.vnet.ibm.com/

Right, I made a mistake and was doing the merge on a different branch,
now that I tried it on my latest perf-tools-next local branch all is
well and the other merge conflict gets auto-resolved
(arm64-sysreg-defs-clean stuff in tools/perf/Makefile.perf "clean" target).

Thanks for checking,

- Arnaldo
