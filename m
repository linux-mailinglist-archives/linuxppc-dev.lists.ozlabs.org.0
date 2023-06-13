Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D772ED13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:35:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wk7pTSUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QggKW58yfz30fC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wk7pTSUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QggJb1DBGz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:34:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A9EF6187D;
	Tue, 13 Jun 2023 20:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F759C433C8;
	Tue, 13 Jun 2023 20:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686688458;
	bh=jwNp4h9PPEmYXaB0IJltuMdZjveh3KTKFfP9o02XV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wk7pTSUE9YZG6Qzyiy/LXXi9unpTZEKB6P6Wl2VeX5UcV5Rpe1MwPOzgzajVVoqD4
	 DmzILRapqXpUeg++De+d8OTR5Gx93TZ40ZRsrOhFjxAL3uF8inM3Cl83BIEF9BNG44
	 qWb37EZ5sSVUZLPAjaCICNi3yo9aezcsQw3aIbF0wr2pmusjqFkkzWDE9TER23bi8p
	 6HtPjLPKmK84T8a8TcBwDY0JaSVAnaakRjJvAdX+W79M3STSQZvdUMfEE78po1siCE
	 Er0OxeMmAMT86IXmkQTJDYq/m1Il3eA0JuGoRNIKG9DMCiakp8OmeOvaZsQpEFG34S
	 FMWe7X/aqsGuQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 0A42240692; Tue, 13 Jun 2023 17:34:16 -0300 (-03)
Date: Tue, 13 Jun 2023 17:34:15 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/17] tool/perf/test: Fix shellcheck coding/formatting
 issues of test shell scripts
Message-ID: <ZIjSxwyna2ExW8JQ@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Jun 13, 2023 at 10:11:28PM +0530, Athira Rajeev escreveu:
> Patchset covers a set of fixes for coding/formatting issues observed while
> running shellcheck tool on the perf test shell scripts. Shellcheck is a static
> analysis tool that can find semantic/syntax bugs in the shell scripts.

Thanks, applied the series.

- Arnaldo
 
> Patches 1-14 fixes the issues found with shellcheck. Patch 15, 16
> and patch 17 address a fix in task_analyzer test.
> 
> This cleanup is a pre-requisite to include a build option for shellcheck
> discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
> Also this is first set of patches. There will be one more set which will
> include build option for shellcheck as discussed in the mail thread.
> 
> Abhirup Deb (2):
>   tools/perf/tests: fix test_arm_spe.sh signal case issues
>   perf/tests/shell: fix shellscript errors for lock_contention.sh
> 
> Aboorva Devarajan (1):
>   tools/perf/tests: Fix shellcheck issues in test_task_analyzer.sh file
> 
> Aditya Gupta (3):
>   perf tests task_analyzer: fix bad substitution ${$1}
>   perf tests task_analyzer: print command on failure
>   perf tests task_analyzer: skip tests if no libtraceevent support
> 
> Akanksha J N (1):
>   tools/perf/tests: Fix shellcheck warnings for
>     trace+probe_vfs_getname.sh
> 
> Anushree Mathur (1):
>   perf/tests/shell : Shellcheck fixes for perf test
>     "test_arm_coresight.sh"
> 
> Barnali Guha Thakurata (1):
>   tools/perf/tests/shell/stat_all_metrics: Fix shellcheck warning SC2076
>     in stat_all_metrics.sh
> 
> Disha Goel (1):
>   tools/perf/tests: fix shellcheck warning for stat+json_output
> 
> Geetika (1):
>   tools/perf/tests: Fix all POSIX sh warnings in perf shell test
>     test_brstack.sh
> 
> Korrapati Likhitha (1):
>   tools/perf/tests: Fix shellcheck warnings for stat+csv_output
> 
> Samir Mulani (1):
>   tools/perf/tests: fixed shellcheck warnings for perf shell scripts
> 
> Shirisha G (1):
>   tools/perf/tests: fix shellcheck warnings for daemon.sh
> 
> Sourabh Jain (1):
>   perf: get rid of unused import
> 
> Spoorthy S (2):
>   shellcheck : fixing signal names and adding double quotes for
>     expression in test_arm_callgraph_fp
>   tools/perf/tests: Fix all POSIX sh warnings in stat+shadow_stat.sh
> 
>  .../scripts/python/arm-cs-trace-disasm.py     |   1 -
>  tools/perf/tests/shell/buildid.sh             |  12 +-
>  tools/perf/tests/shell/daemon.sh              | 113 ++++++++++++------
>  tools/perf/tests/shell/lock_contention.sh     |  70 +++++------
>  .../shell/record+probe_libc_inet_pton.sh      |   6 +-
>  .../shell/record+script_probe_vfs_getname.sh  |   4 +-
>  tools/perf/tests/shell/stat+csv_output.sh     |   4 +-
>  tools/perf/tests/shell/stat+json_output.sh    |   2 +-
>  tools/perf/tests/shell/stat+shadow_stat.sh    |   4 +-
>  tools/perf/tests/shell/stat_all_metrics.sh    |   6 +-
>  .../perf/tests/shell/test_arm_callgraph_fp.sh |   6 +-
>  tools/perf/tests/shell/test_arm_coresight.sh  |   6 +-
>  tools/perf/tests/shell/test_arm_spe.sh        |   2 +-
>  tools/perf/tests/shell/test_brstack.sh        |  12 +-
>  tools/perf/tests/shell/test_task_analyzer.sh  |  98 ++++++++-------
>  .../tests/shell/trace+probe_vfs_getname.sh    |   6 +-
>  16 files changed, 203 insertions(+), 149 deletions(-)
> 
> -- 
> 2.39.1
> 

-- 

- Arnaldo
