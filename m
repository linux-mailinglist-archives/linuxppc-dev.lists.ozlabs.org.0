Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B23806113
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 22:51:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=famdhsM1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlDkd1r7wz3dBc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 08:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=famdhsM1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlDjh6L9nz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 08:50:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A0D2CE114D;
	Tue,  5 Dec 2023 21:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F9C433C7;
	Tue,  5 Dec 2023 21:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701813026;
	bh=VLI7kPveWbWwPgk7uPRYKi16eKz1FOlaDzT1BH/sKiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=famdhsM1YLcq2pCSZLqtoXfVPUfHCbzVp2dG801ncktsbcUY6cYXCOwvvjFSg1XaG
	 OrZqZuJ2e3ueGZWgmxhMjQW/vpFSO8rEUHERJws713+qCZ+m3n82ZPECtKdWJ+UVg+
	 Uv1S9q5Pk4OUU91lnSMfTm67o2cewixMQg7WB7GcALL7oSLifrO8aqU+UhjXIU1t4Z
	 I5chfcIJoP3ivgwiFDr9BFhpAI8UcHIh0zl5xx5MrmF/BYKKRNTkLvlcsjvbO+d3vj
	 /CV6+kOqLuUFcAZpPJcl+v+5bitQOil14M/WF43Zr37MOOXDqYcehnY+cOn0X1n0Ea
	 tQYfKnONW8Y2w==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 18C6F40094; Tue,  5 Dec 2023 18:50:24 -0300 (-03)
Date: Tue, 5 Dec 2023 18:50:24 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@arm.com>
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Message-ID: <ZW+bIGC3r2dcTQUO@kernel.org>
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
> On 23/11/2023 16:02, Athira Rajeev wrote:
> > --- a/tools/perf/Makefile.perf
> > @@ -1134,6 +1152,7 @@ bpf-skel-clean:
> >  	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
> >  
> >  clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
> > +	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> >  	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
> >  	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
> >  	$(Q)$(RM) $(OUTPUT).config-detected

While merging perf-tools-next with torvalds/master I noticed that maybe
we better have the above added line as:

+   $(call QUIET_CLEAN, tests) $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean

No?

Anyway I'm merging as-is, but it just hit my eye while merging,

- Arnaldo
