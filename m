Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 798FE1F3E0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:25:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hC7w60PlzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 00:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BLKM8tZ4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=J5M7K4wy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hBQj56MgzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 23:52:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591710770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QZxzGJLd7MwraWpl9HYsPVgjFSkkdnN13rxpeDTWvE=;
 b=BLKM8tZ4N1q9E0IuymYcR8pZDXGiMMMea1s1+R809d5Z1pkacLw73WTXXFCaojw+gDu5Xp
 FaesldTLbUD+JH7cOhRokmCgM8oV+NBj5PJ3KrW4v0O964XL2uIrfUhT9WlbxCRYnxJWqG
 XEG6NRsM8mjmCEsNmOStjK/Zru6sGk4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591710771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QZxzGJLd7MwraWpl9HYsPVgjFSkkdnN13rxpeDTWvE=;
 b=J5M7K4wyVfuKknshqtyHUax+VtznoTa7LVrwmx3tbNrjUMwLnpSg11Cu/wpU7HSzuC9TKp
 mYD82lNtGswC+a6ZWqggBlB/EtEbWF3W4qpsrcUSVkv3OVB9h9Oyc7jceWKSiD2RF9H2CY
 PrpJ5IAFA6gJF6Sp1DjJojgOVLE6vgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-347KQqv8OfOLOyQ5JWpIlg-1; Tue, 09 Jun 2020 09:52:41 -0400
X-MC-Unique: 347KQqv8OfOLOyQ5JWpIlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABD3880B734;
 Tue,  9 Jun 2020 13:52:33 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-78.ams2.redhat.com
 [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 708335C1BD;
 Tue,  9 Jun 2020 13:52:19 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: Add a new fchmodat4() syscall, v2
References: <20190717012719.5524-1-palmer@sifive.com>
Date: Tue, 09 Jun 2020 15:52:17 +0200
In-Reply-To: <20190717012719.5524-1-palmer@sifive.com> (Palmer Dabbelt's
 message of "Tue, 16 Jul 2019 18:27:15 -0700")
Message-ID: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mailman-Approved-At: Wed, 10 Jun 2020 00:20:38 +1000
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
Cc: dalias@libc.org, catalin.marinas@arm.com, linux-sh@vger.kernel.org,
 peterz@infradead.org, heiko.carstens@de.ibm.com, stefan@agner.ch,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 namhyung@kernel.org, kim.phillips@arm.com, paulus@samba.org,
 deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-ia64@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, hare@suse.com, gor@linux.ibm.com,
 ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com,
 geert@linux-m68k.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org,
 firoz.khan@linaro.org, mattst88@gmail.com, fenghua.yu@intel.com,
 Arnd Bergmann <arnd@arndb.de>, jolsa@redhat.com, tycho@tycho.ws,
 acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org,
 ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org,
 alexander.shishkin@linux.intel.com, tglx@linutronix.de, christian@brauner.io,
 rth@twiddle.net, axboe@kernel.dk, dhowells@redhat.com, monstr@monstr.eu,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Palmer Dabbelt:

> This patch set adds fchmodat4(), a new syscall. The actual
> implementation is super simple: essentially it's just the same as
> fchmodat(), but LOOKUP_FOLLOW is conditionally set based on the flags.
> I've attempted to make this match "man 2 fchmodat" as closely as
> possible, which says EINVAL is returned for invalid flags (as opposed to
> ENOTSUPP, which is currently returned by glibc for AT_SYMLINK_NOFOLLOW).
> I have a sketch of a glibc patch that I haven't even compiled yet, but
> seems fairly straight-forward:

What's the status here?  We'd really like to see this system call in the
kernel because our emulation in glibc has its problems (especially if
/proc is not mounted).

Thanks,
Florian

