Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D310EE1B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 13:58:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t38N1LtXzDqRq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 21:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t36Z6XR9zDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 21:56:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 44t36Z58Vqz9sCJ; Mon, 29 Apr 2019 21:56:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44t36Z4BWlz9s6w;
 Mon, 29 Apr 2019 21:56:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH stable v4.4 00/52] powerpc spectre backports for 4.4
In-Reply-To: <20190429070357.GA3167@kroah.com>
References: <20190421142037.21881-1-mpe@ellerman.id.au>
 <20190421163421.GA8449@kroah.com> <87o94qac1z.fsf@concordia.ellerman.id.au>
 <87a7g99viy.fsf@concordia.ellerman.id.au> <20190429070357.GA3167@kroah.com>
Date: Mon, 29 Apr 2019 21:56:36 +1000
Message-ID: <877ebd9g97.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: npiggin@gmail.com, diana.craciun@nxp.com, linuxppc-dev@ozlabs.org,
 stable@vger.kernel.org, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <gregkh@linuxfoundation.org> writes:
> On Mon, Apr 29, 2019 at 04:26:45PM +1000, Michael Ellerman wrote:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Greg KH <gregkh@linuxfoundation.org> writes:
>> >> On Mon, Apr 22, 2019 at 12:19:45AM +1000, Michael Ellerman wrote:
>> >>> -----BEGIN PGP SIGNED MESSAGE-----
>> >>> Hash: SHA1
>> >>> 
>> >>> Hi Greg/Sasha,
>> >>> 
>> >>> Please queue up these powerpc patches for 4.4 if you have no objections.
>> >>
>> >> why?  Do you, or someone else, really care about spectre issues in 4.4?
>> >> Who is using ppc for 4.4 becides a specific enterprise distro (and they
>> >> don't seem to be pulling in my stable updates anyway...)?
>> >
>> > Someone asked for it, but TBH I can't remember who it was. I can chase
>> > it up if you like.
>> 
>> Yeah it was a request from one of the distros. They plan to take it once
>> it lands in 4.4 stable.
>
> Ok, thanks for confirming, I'll work on this this afternoon.

Thanks. If there's any problems let us know.

cheers
