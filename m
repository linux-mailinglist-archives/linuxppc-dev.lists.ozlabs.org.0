Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91664673F6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 18:00:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyTRD3Q5Qz3fH1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 04:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xd3Bf6HH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xd3Bf6HH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyTQF5S2Lz3fD7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 04:00:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 590FEB8266A;
	Thu, 19 Jan 2023 17:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2D3C433EF;
	Thu, 19 Jan 2023 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674147600;
	bh=0LgZVJyAgZJnPBzrQQTPDRzVjAbI65GHyE56eV+lyrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xd3Bf6HHJcFCVAu8Rq+CoFDPZNFAh7dqGytDjxmbArUWhhPzs8PxvNZwKsfm+VCEs
	 US6ko6KiHQ4PoWfY0xCSUGfNwGWY9K8GMObRYcpQXWzBA32CKeGAOm3KytAsdmIF4+
	 Oyp6PgOY6Ttfy5dXpT3BHvh8h1I39DJ6Yue6zYDzQ7+pZOEVKGhy7T6hlbSARFQLqm
	 JOHRat9zJjB9axRb33H55KfeVQtoioCDQFHOqLMnwx9QEm7NVqCg+Dj1/NYw/+Aeza
	 8V6GLSRdtfYaNBwLa2gEMUvepganuoZqsYWwyTpD+PwzXVpvbiUX4FJVUgl4nriMJC
	 F5FuEMdIxCFZw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 60534405BE; Thu, 19 Jan 2023 13:59:55 -0300 (-03)
Date: Thu, 19 Jan 2023 13:59:55 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH V3] tools/perf/tests: Fix string substitutions in build
 id test
Message-ID: <Y8l3C8LOohZvQOKH@kernel.org>
References: <20230119142719.32628-1-atrajeev@linux.vnet.ibm.com>
 <1a2f988593a4403db2a043ff42886ced@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a2f988593a4403db2a043ff42886ced@AcuMS.aculab.com>
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
Cc: "irogers@google.com" <irogers@google.com>, "ak@linux.intel.com" <ak@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 'Athira Rajeev' <atrajeev@linux.vnet.ibm.com>, "james.clark@arm.com" <james.clark@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.ibm.com" <disgoel@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Jan 19, 2023 at 03:49:15PM +0000, David Laight escreveu:
> From: Athira Rajeev
> > Sent: 19 January 2023 14:27
> ...
> > The test script "tests/shell/buildid.sh" uses some of the
> > string substitution ways which are supported in bash, but not in
> > "sh" or other shells. Above error on line number 69 that reports
> > "Bad substitution" is:
> 
> Looks better - assuming it works :-)

:-)

Can I take this as an:

Acked-by: David Laight <David.Laight@ACULAB.COM>

?

- Arnaldo
