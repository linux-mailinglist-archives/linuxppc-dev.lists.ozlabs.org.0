Return-Path: <linuxppc-dev+bounces-8440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DFCAAF7A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 12:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtSl66ThQz2yMw;
	Thu,  8 May 2025 20:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746699506;
	cv=none; b=J9n2cH6WFVnh/zdLewrbup0QGk6sR86dgKmytI4Rl8sTnfhcul8g108v3N+HX6b63WcZJb9q0pF3auC/vcA6wN9LfS4jteQSDljf2gSCIVzgqEzRy6EufjshyzyHG23fdcC6lHwLXxDNPIEpo5Bzx2cpWrC/Yd1/JsUzJJqtdRmjOYLK7X6KFp+VoycwxgmP5W2+JYXF0nGBugL64yxEFXuelGTsws3TXeEJCKuGe5Xc8F6C/7m+gtPqHqqL99XxzDneOKSvKuAjH0sy8v9Uaop4QIHUkiLnbnjTUyBd1d88z+7tF10qoqIOKj+DmNfWF8aMS8Irj6nz8hhdGl2vBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746699506; c=relaxed/relaxed;
	bh=1GhA7/lDNHd0kGppcpukgkSXPk5MyS9B3Xfo7KINK3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyXiaBFpHTXuSBxOmX9kydgsoSAMFB46TjMZLo8DjIBgQGV1NIdcLidDHMFPXPVg+4qP2POsG6wjvHm7zpKNItpwdTZ3PXqvgrqw4Qo1HK1pP4qYcYztVWJDmTmPZji9HG6JWw8a8NhLMlWsXmGJjulqGwky/hSmuCtQexzQDGtYkjGbp3PqlontNJmE73OQC3PBIQLecHuffFlT4oVx5OCBYdT4FRkam8h1NrEZTMwG5NME0DtnqdePWj9b+9tm/M3Ws8wpbVx0IV5dN9r6JhfRc5im4dAmA/zwscmduGgzmkpuVCmqZnQIumvNaJ/pDjJE/xP4zRbmH+PDxP8pkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AfZKBzkn; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AfZKBzkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtSl42F5Tz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 20:18:23 +1000 (AEST)
Date: Thu, 8 May 2025 12:17:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746699483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GhA7/lDNHd0kGppcpukgkSXPk5MyS9B3Xfo7KINK3g=;
	b=AfZKBzknS+DbpTVRIPr1zvzkRLYv6fXEHDnDEDYcCExh0aE6OYtyaDo8V08UjaFxPscw3+
	P57ANKVT1EM5+yNonHzhUVo/3P9niiTyvm7wi8qCYPF0386ZIOUMdnlE1lJXkzQY/gFTQW
	wsTImcxyHuTbred9xnSDoQxJz3Q601I=
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
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <20250508-891f2b49d5c959fe3558865d@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
 <aBxw1uaO1FZQ15VR@raptor>
 <20250508-0227212b80950becb999ad30@orel>
 <aByB7IphzIq61BMN@raptor>
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
In-Reply-To: <aByB7IphzIq61BMN@raptor>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 11:05:32AM +0100, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Thu, May 08, 2025 at 11:39:54AM +0200, Andrew Jones wrote:
> > On Thu, May 08, 2025 at 09:52:38AM +0100, Alexandru Elisei wrote:
> > > Hi Drew,
> > > 
> > > On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> > > > On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > > > > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > > > > architectures can only set --target to 'qemu', which is also the default.
> > > > > 
> > > > > Needed to make the changes necessary to add support for kvmtool to the test
> > > > > runner.
> > > > > 
> > > > > kvmtool also supports running the riscv tests, so it's not outside of the
> > > > > realm of the possibily for the riscv tests to get support for kvmtool.
> > > > > 
> > > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > > ---
> > > > >  configure | 36 ++++++++++++++++++++++++------------
> > > > >  1 file changed, 24 insertions(+), 12 deletions(-)
> > > > >
> > > > 
> > > > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > > 
> > > Thank you for the review!
> > > 
> > > Just to be clear, you are ok with this happening because of the patch:
> > > 
> > > $ git pull
> > > $ make clean && make
> > > $ ./run_tests.sh
> > > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
> > > qemu-system-x86_64: 2: Could not open '2': No such file or directory
> > > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > > FAIL apic-split
> > > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
> > > qemu-system-x86_64: 1: Could not open '1': No such file or directory
> > > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > > FAIL ioapic-split
> > > [..]
> > > 
> > > That's because TARGET is missing from config.mak. If you're ok with the
> > > error, I'll make it clear in the commit message why this is happening.
> > >
> > 
> > It's not ideal, but I think it's pretty common to run configure before
> > make after an update to the git repo, so it's not horrible. However,
> > as you pointed out in your cover letter, this can be mitigated if we
> > use function wrappers for the associative array accesses, allowing
> > $TARGET to be checked before it's used. I'd prefer the function wrappers
> > anyway for readability reasons, so let's do that.
> 
> I'm all for the function wrappers, I was planning to reply to that comment
> later.
> 
> As to this patch, is this what you're thinking:
> 
> function vmm_optname_nr_cpus()
> {
> 	if [ -z $TARGET ]; then
> 		echo vmm_opts[qemu:nr_cpus]
> 	else
> 		echo vmm_opts[$TARGET:nr_cpus]
> 	fi
> }

Yup

> 
> But checking if $TARGET is defined makes this patch useless, and I would
> rather drop it if that's the case.

Sounds good.

Thanks,
drew

