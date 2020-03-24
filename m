Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4B190549
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:42:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mgBX71YMzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZwbjcRJi; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mg8g6BjnzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:41:05 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id h11so6947025plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=hYsqg+zYS87R4jaMqHtWOgsNlEmV/n0zkX0bVS789vI=;
 b=ZwbjcRJi6BsZ1eEoG/U0oPGOhPIoX3CaEpRM4hwFtRmCllOgDFhyuRd0aZ8cxJY1ko
 R4uXvAdPD9EuYnFPnFCemJT0uytbWuPnM4728DDVK5nlEan4EBJRWaXjAkSuvTZYcW4w
 OmfZsdNbgfPbUVCa3xd8UvCCtDJBsQNYE484YjhJ63lWino1Il5PnnmZnN9ecDWL3ONr
 rBEArP5HRHKDjV3EhU/muRpkfWtwJkyCpawgLtBh+hR0EhEaSDqQwmbyaqR7kzpxrQ4L
 sM1GLvb44Mptbs9Osd9s5sdXIHjVVLaLops2mnI4kL3FM23nK5jFQzzkXqXHlJZfTLyK
 pjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=hYsqg+zYS87R4jaMqHtWOgsNlEmV/n0zkX0bVS789vI=;
 b=Z8j2Gn96+PkXyDSfkLykSWQ9BNrTBTIzCrUigawNir3cv541DJA6gLLaq200N/whcf
 rQEFVkHwEoW61MglJkNGsifuzJs5fMHcJLfXHrzmEvS/EkyKva5KRMpN9RNrU6t9zYSd
 jKv4aePM4nUwnkN7ZU+srK+Qn9OhEcXLGzK3MPR+8pXjPj+JftsYEWScnFjiBTYy2RzX
 FhABACMmOF9Jt71Un4k7+EJX0RpohTUmYvypcHqoDcbox8751IKe7Azq8tvkMEXQ35LE
 RGQ9mL89OFnftk+i5W9r7JlDy+gVmWn6x2OXuDSFt4s70KCLY153rJo6t7XkFqYt+1q1
 j+Fg==
X-Gm-Message-State: ANhLgQ0P62iiCN4WjDvJCh0RGY5y8r2syfZbIWPVsXPQ1lNG5YwaQXVd
 orAJMPWlU6BLopIXO4d7V/s=
X-Google-Smtp-Source: ADFU+vtX7De1LWAG6rrNd92hYINI9RO7dlnf3r5z60vENZTXU5+/XxuSdP3f8Z7H1IOh+O1dWywMAw==
X-Received: by 2002:a17:90a:30c7:: with SMTP id
 h65mr3519181pjb.44.1585028462457; 
 Mon, 23 Mar 2020 22:41:02 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id n29sm10233632pgf.33.2020.03.23.22.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 22:41:01 -0700 (PDT)
Date: Tue, 24 Mar 2020 15:40:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 14/16] powerpc64: Add prefixed instructions to
 instruction data type
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-15-jniethe5@gmail.com>
 <1584947189.oay6araq0n.astroid@bobo.none>
 <CACzsE9rbxV6HErxhwseMEJu7APezvRu4pKOx5YkepEnUWtpzqw@mail.gmail.com>
In-Reply-To: <CACzsE9rbxV6HErxhwseMEJu7APezvRu4pKOx5YkepEnUWtpzqw@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585028271.y7k9vfaaar.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 24, 2020 9:45 am:
> On Mon, Mar 23, 2020 at 6:37 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on March 20, 2020 3:18 pm:
>> I'm a bit against using partially constructed opaque type for things
>> like this, even if it is in the code that knows about the type. We
>> could modify ppc_inst_prefixed() to assert that pad is equal to zero
>> (or some poisoned value) if it's not prefixed. Or do some validation
>> on the suffix if it is.
> Okay what about something like:
> +static inline ppc_inst ppc_inst_read(const void *ptr)
> +{
> +     u32 prefix, suffix;
> +     prefix =3D *(u32 *)ptr;
> +     if (prefix >> 26 =3D=3D 1)
> +             suffix =3D *((u32 *)ptr + 1);
> +     else
> +             suffix =3D 0;
> +     return PPC_INST_PREFIX(prefix, suffix);
> +}

Sure, if that's the best way to test prefix.

>> Although there's proably no real performance or atomicity issues here,
>> I'd be pleased if we could do a case for prefixed and a case for non
>> prefixed, and store the non-prefixed with "std". Just for the principle
>> of not having half-written instructions in the image.
> Do you mean store the prefixed with std?

Oops, yes.

>> > @@ -881,7 +882,6 @@ static struct bpt *new_breakpoint(unsigned long a)
>> >               if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0=
) {
>> >                       bp->address =3D a;
>> >                       bp->instr =3D bpt_table + ((bp - bpts) * BPT_WOR=
DS);
>> > -                     patch_instruction(bp->instr + 1, PPC_INST(bpinst=
r));
>> >                       return bp;
>> >               }
>> >       }
>>
>> Why is this okay to remove?
> When we only had word instructions the bpt was just patched in here
> once and that was that.
> With prefixed instructions bp->instr + 1 might be the suffix. So I
> moved putting the breakpoint to insert_bpts():
> patch_instruction(bp->instr + ppc_inst_len(instr), PPC_INST(bpinstr));

Ah okay.

Thanks,
Nick
=
