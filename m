Return-Path: <linuxppc-dev+bounces-5453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC33A1801D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 15:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcqfY0GsVz2xH9;
	Wed, 22 Jan 2025 01:41:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737470516;
	cv=none; b=VFCH+nG9nJID2lZ0b27ezgYmLb8l1sLwBb/Mjk+wYpvR/kAa8IU3iocXi0ecR1lJglxwnm8kxKoD/3GPhgFSC4MvsQpXHjblEHTze1Ys8vWQO9ipzpjXx5Wx5RgZNA12jizQ0T8slJdFP2bp4T968SKNf8H7dBP0wJ9XmRXpLqZgC6/CXSf5uL5w3BXRa6OWQJDsedEuXunwElVw1W/kGZYaaIszjwdmkunABHpZ9262beiVpRiDYnzLyjZHh83g3dmFtrOKPrUBUZJHWwKsn5fdnuHRso3aa4DnmLDoiQxTjufKyjiltlwQaHNVf97uoR+Yg23FoO8VuOx/A1etxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737470516; c=relaxed/relaxed;
	bh=gf/1W+m78aXfLIDaJ6uGUwztghDrNUX5iY9PP5ywKHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZL1zQhQa5CaFUTFxpgE+Q58A8mW6wi+LzX0VSSBhbSp4vQ53mqcYT+R+mPmh2aX0X94Ynnn1DMz7oV/1pTQyJW1Qe186FHJJ4lPSGgXcJnu0aF5f1PWzk5UICWfSYStBPcYGdmQPJS6kzP6VuHMmVdQeTt49Mr/E/CNAnm8ZyELLEGKGgYyWu+DTTGEZ46eeiawD1N42fXKYneiIfHOmhZb+g7ehSUduEcDZaUMsau5tHLGmbng9IXZVD6qp004cXJrYL75U11cHhNJk8YU2S7csAZJeZG4uYOog531nHhyToSp0MZfd4/vY8tVzLte313DW7AgSgKO110xs+nTeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcqfQ5pf7z2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 01:41:47 +1100 (AEDT)
Date: Tue, 21 Jan 2025 15:41:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737470480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gf/1W+m78aXfLIDaJ6uGUwztghDrNUX5iY9PP5ywKHE=;
	b=MfmAIDOwPguHo8xunevud183sAezfRujYbii7fySiBS7KLOvel3jZLxFLZdOKqYMmnRAAO
	np6PXOSd8Sj3vtB2H3dRlHmdV+23IoNDIVT3J/I9cNdCR0+1cOm1G2sdK2e0n4Fufi6sDY
	SlF0FxE8wfW5aO/P8LGJOhlvzZat4N8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 01/18] run_tests: Document
 --probe-maxsmp argument
Message-ID: <20250121-033cee8123fdac80f70bc0ee@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-2-alexandru.elisei@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:42:59PM +0000, Alexandru Elisei wrote:
> Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
> --probe-maxmp argument, but the help message for run_tests.sh wasn't
> updated. Document --probe-maxsmp.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 152323ffc8a2..f30b6dbd131c 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -17,14 +17,15 @@ cat <<EOF
>  
>  Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>  
> -    -h, --help      Output this help text
> -    -v, --verbose   Enables verbose mode
> -    -a, --all       Run all tests, including those flagged as 'nodefault'
> -                    and those guarded by errata.
> -    -g, --group     Only execute tests in the given group
> -    -j, --parallel  Execute tests in parallel
> -    -t, --tap13     Output test results in TAP format
> -    -l, --list      Only output all tests list
> +    -h, --help          Output this help text
> +    -v, --verbose       Enables verbose mode
> +    -a, --all           Run all tests, including those flagged as 'nodefault'
> +                        and those guarded by errata.
> +    -g, --group         Only execute tests in the given group
> +    -j, --parallel      Execute tests in parallel
> +    -t, --tap13         Output test results in TAP format
> +    -l, --list          Only output all tests list
> +        --probe-maxsmp  Update the maximum number of VCPUs supported by host
>  
>  Set the environment variable QEMU=/path/to/qemu-system-ARCH to
>  specify the appropriate qemu binary for ARCH-run.
> -- 
> 2.47.1
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

