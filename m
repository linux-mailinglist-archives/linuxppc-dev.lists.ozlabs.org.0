Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792F1A86F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:06:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491sNB5lz2zDqxB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iSVZFx1L; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491rRz4pgQzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 02:25:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586881498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW8t58m2bp1NhazlqC7/k8J+nPWsrZBYDWUsjTyk2qQ=;
 b=iSVZFx1LdZzlXzoSX3TMwvZk2Ifhrb7SKzZcOWGst1uS0qKQy8q3w3VSWR/4Eoi3rBu9qt
 ETnC2uNUsR4TAhZnqEV7gbdo3HuFrIR4QDDRt5bzbPnJrHKZEkQ69gJs8SNC6WiMrLU9Il
 vjg2zlItsqSgLEW3T56umH6CcYavH+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-m_CJjLwlPvyXxruKyZ4cKA-1; Tue, 14 Apr 2020 12:24:56 -0400
X-MC-Unique: m_CJjLwlPvyXxruKyZ4cKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12123107ACC4;
 Tue, 14 Apr 2020 16:24:50 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-173.rdu2.redhat.com [10.10.118.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E02D118DEE;
 Tue, 14 Apr 2020 16:24:36 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] crypto: Remove unnecessary memzero_explicit()
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413222846.24240-1-longman@redhat.com>
 <eca85e0b-0af3-c43a-31e4-bd5c3f519798@c-s.fr>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <e194a51f-a5e5-a557-c008-b08cac558572@redhat.com>
Date: Tue, 14 Apr 2020 12:24:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <eca85e0b-0af3-c43a-31e4-bd5c3f519798@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/14/20 2:08 AM, Christophe Leroy wrote:
>
>
> Le 14/04/2020 =C3=A0 00:28, Waiman Long a =C3=A9crit=C2=A0:
>> Since kfree_sensitive() will do an implicit memzero_explicit(), there
>> is no need to call memzero_explicit() before it. Eliminate those
>> memzero_explicit() and simplify the call sites. For better correctness=
,
>> the setting of keylen is also moved down after the key pointer check.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>> =C2=A0 .../allwinner/sun8i-ce/sun8i-ce-cipher.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 19 +++++-------------
>> =C2=A0 .../allwinner/sun8i-ss/sun8i-ss-cipher.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 20 +++++--------------
>> =C2=A0 drivers/crypto/amlogic/amlogic-gxl-cipher.c=C2=A0=C2=A0 | 12 ++=
+--------
>> =C2=A0 drivers/crypto/inside-secure/safexcel_hash.c=C2=A0 |=C2=A0 3 +-=
-
>> =C2=A0 4 files changed, 14 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> index aa4e8fdc2b32..8358fac98719 100644
>> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
>> @@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sun8i_cipher_tfm_ctx *op =3D cry=
pto_tfm_ctx(tfm);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (op->key) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memzero_explicit(op->key, =
op->keylen);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(op->key);
>> -=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 kfree_sensitive(op->key);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 crypto_free_sync_skcipher(op->fallback_=
tfm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_put_sync_suspend(op->ce->dev=
);
>> =C2=A0 }
>> @@ -391,14 +388,11 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher
>> *tfm, const u8 *key,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(ce->dev=
, "ERROR: Invalid keylen %u\n", keylen);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 if (op->key) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memzero_explicit(op->key, =
op->keylen);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(op->key);
>> -=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 op->keylen =3D keylen;
>> +=C2=A0=C2=A0=C2=A0 kfree_sensitive(op->key);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op->key =3D kmemdup(key, keylen, GFP_KE=
RNEL | GFP_DMA);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!op->key)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +=C2=A0=C2=A0=C2=A0 op->keylen =3D keylen;
>
> Does it matter at all to ensure op->keylen is not set when of->key is
> NULL ? I'm not sure.
>
> But if it does, then op->keylen should be set to 0 when freeing op->key=
.=20

My thinking is that if memory allocation fails, we just don't touch
anything and return an error code. I will not explicitly set keylen to 0
in this case unless it is specified in the API documentation.

Cheers,
Longman

