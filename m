Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0D172E74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:00:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCRg1c9qzDrF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 13:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VuPhlvV4; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCNX2csfzDrBG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 12:57:48 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id j9so836562pfa.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=oN8gXu4uPqbaSkbtjtAaawJtC+TaSALhFGxSc4+phPk=;
 b=VuPhlvV4r9CMwQ2RtgdArr33dFIthrq5eK6neqj/cc5n5Kg3069Fmty1kfXqjwKyF4
 hGWb4tru5C6OS5/qiNITeQJQmOc+oUSMQUsysl1jMQq8TW9EVzXylWmboxjquBHzbsy+
 CwHkrKXJq8E7xvu0kev+FCWg/sCnVKfjDVfkWAnqUgttjgJdhuBDQOvMgCbcn+BO8G/S
 0JWR17iQbUFgtWNL5XeaZpq+e0yr0g7SULkzA1ElCdrORvPDHw3Mk9bGIHQt1ZsEwoA9
 b9g2nS/aWTfD9BijjAihppW5J37zPDjpb4sVzRurRH2L7C5w+qR20vxWHN2yyQCl49nr
 Lo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=oN8gXu4uPqbaSkbtjtAaawJtC+TaSALhFGxSc4+phPk=;
 b=r4EtLLDyA9sYXYisORlW9lXPegfTNFHzkTI+i+pryNL6A4ajFQvI0Iq773AwS/InfE
 bXUxQHoP2gSHeZ8KsGzHtOA5iWCaYU+d5/5ysLt4owEgW91ZQ+KB/NQlfUKw3R4DpVSX
 3Au4LnETX3cWBguAIVzUcO/xkS0rB9TEy1K1tdN6tMNwWN+xNDH7+mJXhplI7Da57yKo
 UFWl+tbip7koDOvt4rD3fNPWMapIHSXiw9kaxtcsCikfithqMVKiYKrRyEjp0wmhbJeK
 oX+lW+jJCvbcHTTXVy2V/wVOfOBPipILJEhqqpVvpQZOs0mJ2x/vcTJGahluuA4qds1O
 URzA==
X-Gm-Message-State: APjAAAVeGAOi3W0zGetBP20Sxrz1X51YQ3gkuIf11f+UZq8OlCnmQSO+
 hJbKR9dERP9zBdDW3iwRXDo0MEf6
X-Google-Smtp-Source: APXvYqzF/msvy8Etk8r9C4K/DfvJ/JexJc88jlN4tNnJ9XjyeI5eRrfhG8cHEajfzJaa3vRpekZiMQ==
X-Received: by 2002:aa7:991e:: with SMTP id z30mr1913230pff.259.1582855065876; 
 Thu, 27 Feb 2020 17:57:45 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id 5sm8603027pfx.163.2020.02.27.17.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 17:57:45 -0800 (PST)
Date: Fri, 28 Feb 2020 11:57:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 07/14] powerpc/traps: Check for prefixed instructions
 in facility_unavailable_exception()
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-8-jniethe5@gmail.com>
 <1582699744.9jdw100hst.astroid@bobo.none>
 <CACzsE9qmF+mpPQzL7HN5jOdjCtTJbqWvQQfnOxXkpJMs-fQxRg@mail.gmail.com>
In-Reply-To: <CACzsE9qmF+mpPQzL7HN5jOdjCtTJbqWvQQfnOxXkpJMs-fQxRg@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582855001.7zk74tm1wm.astroid@bobo.none>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 27, 2020 9:52 am:
> On Wed, Feb 26, 2020 at 5:53 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> Jordan Niethe's on February 26, 2020 2:07 pm:
>> > If prefixed instructions are made unavailable by the [H]FSCR, attempti=
ng
>> > to use them will cause a facility unavailable exception. Add "PREFIX" =
to
>> > the facility_strings[].
>> >
>> > Currently there are no prefixed instructions that are actually emulate=
d
>> > by emulate_instruction() within facility_unavailable_exception().
>> > However, when caused by a prefixed instructions the SRR1 PREFIXED bit =
is
>> > set. Prepare for dealing with emulated prefixed instructions by checki=
ng
>> > for this bit.
>> >
>> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>
>> Oh you've got it here, I would just squash this together with the first
>> patch.
> Sure, I'll put them together. When you mentioned a couple more things
> to do in traps.c, was it just this? Or is there still more to be done
> adding an FSCR?

Hmm... maybe it's just that one.

Thanks,
Nick
=
