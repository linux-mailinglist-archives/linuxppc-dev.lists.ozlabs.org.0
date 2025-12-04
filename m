Return-Path: <linuxppc-dev+bounces-14629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E16CA5970
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 23:12:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMpdt1dGPz2xQ1;
	Fri, 05 Dec 2025 09:12:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764886338;
	cv=none; b=HB3D8fLimZj3zJVVrMYRIPzq+l7XtNd9rLmnnaPceyJthHzcdPRpdtHv0eAYjEZFDuyTNDleCs6NMCX/hQiE7h5vuTg16lQrzJSIZv/xVQig39aYClhF2SrqzthuQqgTXipB/NJzlhVPes6e6+lsi1OgoCQ+JKifNUFCI4WbLWfMsNjs8m2pS8/QG2gPTxovgHoUZe/G9edJZSYE0vNnWbdbNCq0Kjgqs5f5F08vdv3fjq0OcqgDNGQgCDmwyCZjVDoXrhE5M0Tocx2SGlriqU2Niyk221QcpU8RxPr7HqQ+4iFnvg95DS2Ley3XrZWFQaLdH7jo0kbJMi4t0JftMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764886338; c=relaxed/relaxed;
	bh=f6o6wb1SzKvDVPK/vKLO178hrGck2AjfeqCB0/HR958=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuCfc30fFIrW03FQ9PcKSTNHtd4kWI3pacl2aCKpjo1ShATYoMmy4WEKxzkGnADu9n7l5i7Ss67Wg+Q8N9Fvxt2q4LO+kpggo7GiyCgwST75r8bn2EIcqoGlV+978BikU7Br/hasFY3rTHR5edRC5TuqDRUKbQudH0MckTi4wR15OwtVG9b5UEoifF7RA0Bwoj0C7bicgyD19/LppQM3Bcb2LSw+G3t4aZsSMRGxtFAoPSaMi7C1aB4JG8+dKZr+RsRbGMPgTeUN0xTwtqQHzMBAqijj61JQEA1VFRuJoYD0GjpCxUAmrJ5cey2h82Rv0e5JHJ1TJ4D17wKKRBBHyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IAzw1OUH; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IAzw1OUH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMpds1cdLz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 09:12:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD13C601ED;
	Thu,  4 Dec 2025 22:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17168C113D0;
	Thu,  4 Dec 2025 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764886334;
	bh=ubLwl5+CgitwUP+ApeREHrjaIt9HSqJeqF496mwgdzU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IAzw1OUHYgUWBP5mdicRgkXgo68l062ZNu3AOYLPZXPFoAEtFD1fhoIwy2uRycPZY
	 96wUtdi8CnoG3eZUHlVW37tSpWW6YJl6D8dn2jqFgwB+4tDZ9jzkbADts5LgJ94LKX
	 9u5T6aFzJsO61OIQXrXQfZqjRX+qVBy1/I2z7Vxe1H/OExo7dhtAtfnEkgg69CRkGk
	 4VGCkxc6Zf/JDHGdwrUYFCpVp6pb3dBU9b5LZBoBse7FvyGmKojZRmzdvvgpvpiMpb
	 mF5For1ffogsUFSD6jGYvu7hFZWxq0+HwB5Y85vSctNh9hlsn5Ox6Mku0zKBmni9Mb
	 F1Twn2KYLcVzg==
Message-ID: <b64f1627-0627-4e4a-b547-5e54167f318e@kernel.org>
Date: Thu, 4 Dec 2025 23:12:06 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
To: Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 22:57, Andrew Morton wrote:
> On Wed,  3 Dec 2025 19:33:56 -0700 Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
>>
>> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
>> systems. git fetch-pack fails when cloning large repos and make hangs
>> or errors out of Makefile.build with Error: 139. These failures are
>> random with git clone failing after fetching 1% of the objects, and
>> make hangs while compiling random files.
>>
>> The blow is is one of the git clone failures:
>>
>> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
>> Cloning into 'linux_6.19'...
>> remote: Enumerating objects: 11173575, done.
>> remote: Counting objects: 100% (785/785), done.
>> remote: Compressing objects: 100% (373/373), done.
>> remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
>> Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
>> Resolving deltas: 100% (9195212/9195212), done.
>> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
>> fatal: fetch-pack: invalid index-pack output
> 
> 39231e8d6ba7 simply shuffles ifdefs and Kconfig items, so I assume it
> exposed a pre-existing bug.
> 
> Reverting 39231e8d6ba7 will re-hide that bug.
> 
> And that isn't a bad thing.  If we re-hide the bug in 6.18.x and in
> mainline then that relieves the people who are hitting this and it
> takes the pressure off David, Mike and yourself to get the underlying
> bug fixed in a hurry.
> 
> So I think I'll queue this as a hotfix, plan to send it Linuswards in a
> couple of days.
> 
> Or Linus may choose to apply it directly or to do a local revert of
> 39231e8d6ba7.  But I don't see how a local revert will get communicated
> to the 6.18.x maintainers.
> 
> David, Linus, opinions please?

I have so far no indication that this patch here would change anything 
relevant to the problem we are seeing, all it does is changing 
MAX_FOLIO_ORDER that does not affect any logic we would really care 
about here (safety checks and snapshot_page()).

Can we please wait a bit so we have confirmation that it's not a 
leftover from the huge-zero-folio thingy or something different?

As Mike reports, he found ways to reproduce something similar even with 
39231e8d6ba7 reverted.

-- 
Cheers

David

