Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EF1FC864
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 10:18:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49myd23rQhzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 18:18:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.voyer@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n7fvTs+/; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49myHx6mZGzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 18:03:38 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id dp18so1288092ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=n7fvTs+/AIa8pMpfW6aPzMLlPj+Dgki9bUAxy/WJhTzuhCBbd+H1VjHgPGq499Rpv/
 5d/Fu/pYEKH1b6nUOp+B/0rVShHG5a3F5X6E9yohIERXhGRB+jfz7fG7aLScoIpx8e+F
 hoa3YKo1A1lDCasydfb4WIy1UyVUOIk9DfVXXMnVNv4WGz8gFNusqZ8XbJsGTDUN9Fqb
 G31mdXjKpT3KyemJTlD9XocjfZeFc/GyLV2zWtdzsLpQAbvFvS3y1YSYDd18MIgGQFXl
 /yNkjvwU7T7hVY2TKYobQ4wa9+HTev7V+Zm0ABk5R4hLFzxjXuIxIeh+PmN3kmrE6ePT
 RYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IoLOTj4N/UivUbV7Xr+eQksZLmcOCCkaL8Z2FZzpaSE=;
 b=fMhQs7GWnGoOIpoyNGJbcELJ/FVEIijN/4+07vV6MD8ZJhqYC91wDVo1nA0cSHfZJg
 JSbooLYfO2vDUqSFOzgSOCIKhwBM5idjXYYaThp6qP/viXo5i/YgdMTLCrI3JrFpIPH0
 ymPa5SFhnrXjunanHFjS2nnSGTQU9BGTXEFugW0aO+7CzivFRssAwUczbyEAQQ5YzV0y
 zQuGKBBdOa8DTMrJ10tyqndEGPs/2dP9j3843055Q4Jk4XAbaViTNvD29mkTAk6SBhBz
 wBQFpCnKlWIaVMWLsnXOJoyJJ5rpQzDKWaCC6u/B2SQdXKQJk4+jPmi4nisKQmLeLUIC
 D+Gw==
X-Gm-Message-State: AOAM530n+mw4ynEF78Py36nnHxRbachvs0xpZsyU01mrm2uTUYtx+hhM
 TnamebV8LfrG8VHma3cfgXw=
X-Google-Smtp-Source: ABdhPJwEiLAyKqBWSBg/9gW1RJJ++WW+xletvVfauJvMuZRCPanBDVczGoSWbdvhRqSEjwIJMjoADg==
X-Received: by 2002:a17:906:1149:: with SMTP id
 i9mr6779545eja.100.1592381013809; 
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Received: from [10.31.1.6] ([194.187.249.54])
 by smtp.gmail.com with ESMTPSA id n16sm12971271ejl.70.2020.06.17.01.03.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:03:33 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
From: Jo -l <joel.voyer@gmail.com>
In-Reply-To: <20200617003711.GD8681@bombadil.infradead.org>
Date: Wed, 17 Jun 2020 10:03:30 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <29829792-2C3E-44D1-A337-E206F1B6C92A@gmail.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 17 Jun 2020 18:16:56 +1000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 dsterba@suse.cz, David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bonjour,
D=C3=A9sol=C3=A9, aucune traduction possible,=20
En fran=C3=A7ais pour comprendre!
Merci
slts

> Le 17 06 2020 =C3=A0 02:37, Matthew Wilcox <willy@infradead.org> a =
=C3=A9crit :
>=20
> On Wed, Jun 17, 2020 at 01:01:30AM +0200, David Sterba wrote:
>> On Tue, Jun 16, 2020 at 11:53:50AM -0700, Joe Perches wrote:
>>> On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
>>>> v4:
>>>> - Break out the memzero_explicit() change as suggested by Dan =
Carpenter
>>>>  so that it can be backported to stable.
>>>> - Drop the "crypto: Remove unnecessary memzero_explicit()" patch =
for
>>>>  now as there can be a bit more discussion on what is best. It will =
be
>>>>  introduced as a separate patch later on after this one is merged.
>>>=20
>>> To this larger audience and last week without reply:
>>> =
https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.came=
l@perches.com/
>>>=20
>>> Are there _any_ fastpath uses of kfree or vfree?
>>=20
>> I'd consider kfree performance critical for cases where it is called
>> under locks. If possible the kfree is moved outside of the critical
>> section, but we have rbtrees or lists that get deleted under locks =
and
>> restructuring the code to do eg. splice and free it outside of the =
lock
>> is not always possible.
>=20
> Not just performance critical, but correctness critical.  Since =
kvfree()
> may allocate from the vmalloc allocator, I really think that kvfree()
> should assert that it's !in_atomic().  Otherwise we can get into =
trouble
> if we end up calling vfree() and have to take the mutex.

Jo-l
joel.voyer@gmail.com



