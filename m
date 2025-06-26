Return-Path: <linuxppc-dev+bounces-9835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53741AEA2EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:44:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjfN66GGz30TG;
	Fri, 27 Jun 2025 01:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750952652;
	cv=none; b=Hrr2npp7Jr8gFr/mNlIAIhcNO0GgPRrT4eFfk+yEnazj9XvmkvmEGM8EWDQSM1M4uyqzVg4qs3ZQ/lU9wXd9Rq8GQoPkBu1c/H1AaarqLHpxHpcP4PI6xbIuA7x5DQSAhVaeV9/p2xxKV5Cvx8VZpY34HQJLPBSZ+m52abmNPwqKkRmKW7Ere4tzRsjjTSpxyIpfWQZFqhpO022PST5qrWyPOhRWV0ujQQJWyr2EKhgAVkD8Ps1ppN3yvn6gboCe39X2mIjdyOySWjFzbRHi50BVIDKpNO0a3TBvREv/BT11D1tbSPunKc4nUkh1FWLQsUchIqDNhEgsFmU4fiawDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750952652; c=relaxed/relaxed;
	bh=YqF99bj8Q8kofbXVGew8HAlAeKaELqV+g5gmPlCqwnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQKEWcpqD/rHEjbGyuXrVGFlXiMuoFY6zwzbDbS/tQT1gnOCWCre1BzhF67n6hOENtV3Zl7/JRdBg4555NByb4bH/0tEzclK0+Y7hA3wYxbLWgm3HGZIGVo9dMylf30b2Bk83Tzm50DD+xAUfGKZ+G5nNajHn2jmLu5n3O1B2YWkGcwEOWZP60oCmPqUPqbcJWARn1SQMgH2pw2KD48yP9g0CHCOH3oj3Vy5P3/CRYrFLevFMJj2cv0TIrOo6VIVIHnPbgY+i4pM5Y95xWQH9qrCwv/GCorAgQIDKe2/RBeki7DVh8nHd9nyTkYIxfzZn433AKss6p4VWEfveNjo9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pUawa05C; dkim-atps=neutral; spf=pass (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pUawa05C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 1100 seconds by postgrey-1.37 at boromir; Fri, 27 Jun 2025 01:44:09 AEST
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjfK3Ssjz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:44:08 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:43:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750952627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YqF99bj8Q8kofbXVGew8HAlAeKaELqV+g5gmPlCqwnE=;
	b=pUawa05C00EvjdazdL/LLkZ7I3VgwstMotbdAXlvMcBFRk+BAzQb2kDGvVUU7iR7Wo/bg9
	dHnPEtJco90ywk4SiMLZLYrqBXi2BYPTswxqWZWpuYagiYUfdozf9cXcEZi65KUV2XIySy
	KjYRVYGNzKznmO7vpX2VkB7ilVfSB2Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments
 for kvmtool
Message-ID: <20250626-620bfc4816a1b6089932b946@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-8-alexandru.elisei@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-8-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:07PM +0100, Alexandru Elisei wrote:
> kvmtool, unless told otherwise, will do its best to make sure that a kernel
> successfully boots in a virtual machine. It does things like automatically
> creating a rootfs and adding extra parameters to the kernel command line.
> This is actively harmful to kvm-unit-tests, because some tests parse the
> kernel command line and they will fail if they encounter the options added
> by kvmtool.
> 
> Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> line argument") addded the --nodefaults kvmtool parameter which disables
> all the implicit virtual machine configuration that cannot be disabled by
> using other parameters, like modifying the kernel command line. So always
> use --nodefaults to allow a test to run.
> 
> kvmtool can also be too verbose when running a virtual machine, and this is
> controlled by several parameters. Add those to the default kvmtool command
> line to reduce this verbosity to a minimum.
> 
> Before:
> 
> $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> Unknown subtest
> 
> EXIT: STATUS=127
> Warning: KVM compatibility warning.
>     virtio-9p device was not detected.
>     While you have requested a virtio-9p device, the guest kernel did not initialize it.
>     Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
> Warning: KVM compatibility warning.
>     virtio-net device was not detected.
>     While you have requested a virtio-net device, the guest kernel did not initialize it.
>     Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
> Info: KVM session ended normally.
> 
> After:
> 
> $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> PASS: selftest: setup: smp: number of CPUs matches expectation
> INFO: selftest: setup: smp: found 2 CPUs
> PASS: selftest: setup: mem: memory size matches expectation
> INFO: selftest: setup: mem: found 256 MB
> SUMMARY: 2 tests
> 
> EXIT: STATUS=1
> 
> Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
> variable with the same name, but it's not documented in the help string for
> run_tests.sh. This has been done on purpose, since overwritting
> KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
> purposes.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> Changes v3->v4:
> 
> * Use vmm_default_opts() instead of indexing into vmm_optname
> * Reworded the help test for --nodefaults as per Shaoqin's suggestion.
> 
>  scripts/common.bash |  6 +++---
>  scripts/vmm.bash    | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 7c1b89f1b3c2..d5d3101c8089 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -37,7 +37,7 @@ function for_each_unittest()
>  			# -append as a kernel parameter instead of a command
>  			# line option.
>  			test_args=""
> -			opts=""
> +			opts="$(vmm_default_opts)"
>  			groups=""
>  			arch=""
>  			machine=""
> @@ -51,7 +51,7 @@ function for_each_unittest()
>  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>  			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
>  		elif [[ $line =~ ^$params_name\ *=\ *'"""'(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}$'\n'
> +			opts="$(vmm_defaults_opts) ${BASH_REMATCH[1]}$'\n'"

Could be opts+=" ${BASH_REMATCH[1]}$'\n'", right?

>  			while read -r -u $fd; do
>  				#escape backslash newline, but not double backslash
>  				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> @@ -67,7 +67,7 @@ function for_each_unittest()
>  				fi
>  			done
>  		elif [[ $line =~ ^$params_name\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}
> +			opts="$(vmm_default_opts) ${BASH_REMATCH[1]}"

Same comment.

Not a big deal either way, though, so my r-b stands.

Thanks,
drew

>  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>  			groups=${BASH_REMATCH[1]}
>  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 0dd3f971ecdf..368690d62473 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,3 +1,14 @@
> +# The following parameters are enabled by default when running a test with
> +# kvmtool:
> +# --nodefaults: suppress VM configuration that cannot be disabled (like
> +#               modifying the supplied kernel command line). Otherwise tests
> +#               that use the command line will fail without this parameter.
> +# --network mode=none: do not create a network device. kvmtool tries to help the
> +#               user by automatically create one, and then prints a warning
> +#               when the VM terminates if the device hasn't been initialized.
> +# --loglevel=warning: reduce verbosity
> +: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
> +
>  ##############################################################################
>  # qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
>  # in Table2.  Table3 simply documents the complete status table.
> @@ -82,11 +93,13 @@ function kvmtool_fixup_return_code()
>  
>  declare -A vmm_optname=(
>  	[qemu,args]='-append'
> +	[qemu,default_opts]=''
>  	[qemu,fixup_return_code]=qemu_fixup_return_code
>  	[qemu,initrd]='-initrd'
>  	[qemu,nr_cpus]='-smp'
>  
>  	[kvmtool,args]='--params'
> +	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
>  	[kvmtool,fixup_return_code]=kvmtool_fixup_return_code
>  	[kvmtool,initrd]='--initrd'
>  	[kvmtool,nr_cpus]='--cpus'
> @@ -97,6 +110,11 @@ function vmm_optname_args()
>  	echo ${vmm_optname[$(vmm_get_target),args]}
>  }
>  
> +function vmm_default_opts()
> +{
> +	echo ${vmm_optname[$(vmm_get_target),default_opts]}
> +}
> +
>  function vmm_fixup_return_code()
>  {
>  	${vmm_optname[$(vmm_get_target),fixup_return_code]} "$@"
> -- 
> 2.50.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

