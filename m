Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F68FDE9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 14:13:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DzL96kTVzF75B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 00:13:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Jn5lFI/f"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DzJ34Z0kzF0x4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 00:11:14 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id n13so6674772pff.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VdF8MMu+bP4e0rsVfdQpCfgpPGQbFW5Ll/rpGu4Pq10=;
 b=Jn5lFI/f8wVcj9sHWruYQfb/Eeq9z4tdOzYGpmkvxX7Tae6JoQRWzJRhSsjsfng2Uo
 V2U+XvpdhwQ5jdNrVAvLN/n4yvCWp3p4KoX+/Lq6YtsVLwZJSdwC+n8BnlrRSvEMTxiP
 6RPMtKW8787++U21euvzijpFqHwM3CtkVoEhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VdF8MMu+bP4e0rsVfdQpCfgpPGQbFW5Ll/rpGu4Pq10=;
 b=t05I5l5BDbvVGZjEC85FznLKlfL4hi/Oqt2BK1RD97YIGIdzzGPBTURXjLtVwdHR3L
 4bpQFlhOwxJsoCWVLK0CrY2abMpEzoOc+QxR2Xp5BsnoifE0IwEkjnKkGEVO81+6Dv43
 RdlxpL2RrBX6XbCvPaBDAQgxzgcemeC9PLTECGYtpZkOXPA8GCxYu3J8V8Q3hDKpBWZe
 yso8gtlDGde1vpG45VxyF/0GnOA0m1NWmWCjvPRYU3Huo7jDRf60u7ltPzX5+4iVTQgK
 rqT8bgDw1hLef3tOFSPSGZ0C1UdCv3T6VrOQUdxELx3nc+m4Z9dWBB1oEuRdiog2i6Jc
 oMNQ==
X-Gm-Message-State: APjAAAVMM54X2tbDozxSVQ5rAUiq6MU0gcKygM0q6YsU7ph6tFv0HLyp
 tmU4MNt9tBhm65qt/9inV5+ZXw==
X-Google-Smtp-Source: APXvYqwjS1Ph0MWCRDZcAnOkeAb5th9CJ6963WKqiajxypv1u6VDdP6icoztl/u3rGq4zV6UWWidjA==
X-Received: by 2002:a62:6044:: with SMTP id u65mr17331024pfb.227.1573823468977; 
 Fri, 15 Nov 2019 05:11:08 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1d8-c2a6-5354-14d8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1d8:c2a6:5354:14d8])
 by smtp.gmail.com with ESMTPSA id y16sm11164122pfo.62.2019.11.15.05.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 05:11:07 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
In-Reply-To: <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
References: <20190820024941.12640-1-dja@axtens.net>
 <877e6vutiu.fsf@dja-thinkpad.axtens.net>
 <878sp57z44.fsf@dja-thinkpad.axtens.net>
 <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
Date: Sat, 16 Nov 2019 00:11:03 +1100
Message-ID: <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-s390@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> test_bit() is an atomic bitop. I assume it was meant to be in
> instrumented-atomic.h?

Hmm, interesting.

I was tricked by the generic version doing just a simple read, with only
a volatile attribute to ensure the read occurs more-or-less as written:

/**
 * test_bit - Determine whether a bit is set
 * @nr: bit number to test
 * @addr: Address to start counting from
 */
static inline int test_bit(int nr, const volatile unsigned long *addr)
{
        return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
}

But the docs do seem to indicate that it's atomic (for whatever that
means for a single read operation?), so you are right, it should live in
instrumented-atomic.h.

Sadly, only x86 and s390 specify an arch_test_bit, which will make moving it
into instumented-atomic.h break powerpc :(

I'll have a crack at something next week, probably with a similar trick
to arch_clear_bit_unlock_is_negative_byte.

Regards,
Daniel


>
> Thanks,
> -- Marco
>
>> >> +
>> >> +#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
>> >> --
>> >> 2.20.1
>>
>> --
>> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/878sp57z44.fsf%40dja-thinkpad.axtens.net.
