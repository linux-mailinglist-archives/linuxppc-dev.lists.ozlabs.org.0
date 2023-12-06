Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF5806FB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 13:30:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ehRZTaiX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlcF72Lqvz3d9K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ehRZTaiX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlcCj2KG2z3cW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 23:29:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4176CCE1D0D;
	Wed,  6 Dec 2023 12:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD5C433C7;
	Wed,  6 Dec 2023 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701865757;
	bh=Q0HoZRs2Q9F2t4b+cosMNjZ1vgtsTwFBeajyDqNa8h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehRZTaiXFsk/ydXQ+4ao5HFzJLeWtX/bL+ikaKNp0CGFWNECCN+fL5eXM7EZ/lZl4
	 3iGpJ+bTP9PENPHJhPItf5HRuONIyFzWVcd2vpZ2HioGX91Nu7ZRl+5j38CXJIM0UA
	 sw0fa+0/S7MBICxnqVo5C/ggHBKecwXs/HGD7xZyIdIVvLKouQs3FbIiuKGmWKeTSK
	 6u37INE3uabqmLy4k0+Gw1y8rVCbo6+Rajq6o+MFbmjL/sL6Rdwkv2CR1hXOI2/1AS
	 OkfUj+dcQpJi4zk37idjp6cAHMHU5yn79o49kA0OVgAtdYOaR1vs/CCX0ROzj/oHQ6
	 h/l+Wgti+0NkQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 2CF224041A; Wed,  6 Dec 2023 09:29:15 -0300 (-03)
Date: Wed, 6 Dec 2023 09:29:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Message-ID: <ZXBpG69R2D/nKlTZ@kernel.org>
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
 <ZW+bIGC3r2dcTQUO@kernel.org>
 <46112CD2-2033-4885-863B-CF0F61672E65@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46112CD2-2033-4885-863B-CF0F61672E65@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users <linux-perf-users@vger.kernel.org>, James Clark <james.clark@arm.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Dec 06, 2023 at 10:15:06AM +0530, Athira Rajeev escreveu:
> 
> 
> > On 06-Dec-2023, at 3:20 AM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > 
> > Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
> >> On 23/11/2023 16:02, Athira Rajeev wrote:
> >>> --- a/tools/perf/Makefile.perf
> >>> @@ -1134,6 +1152,7 @@ bpf-skel-clean:
> >>> $(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
> >>> 
> >>> clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
> >>> + $(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
> >>> $(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
> >>> $(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
> >>> $(Q)$(RM) $(OUTPUT).config-detected
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
> Hi Arnaldo
> 
> As Ian pointed we removed Makefile.tests as part of :
> https://lore.kernel.org/lkml/20231129213428.2227448-1-irogers@google.com/

Right, thanks for checking, see my reply to Ian for further details.

- Arnaldo
