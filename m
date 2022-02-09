Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B24AE89E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 05:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtnQn6kdzz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 15:46:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VpsRKjTO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtnQB0xBLz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 15:46:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VpsRKjTO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JtnQ60Fbjz4xNq;
 Wed,  9 Feb 2022 15:46:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644381966;
 bh=4LBu3b4sqV42JJCmT2RvLfUf47/jOabbpGeO17DWNxg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VpsRKjTOAuTL4YVFAXqLwlQNTVN2PnFaRNMaDdmekioS+Axih9wqxwuuZXvgF38GV
 BtlQrTRz2IAQ9QmpujmvPxeEPJBOCKQODVTttnlXUqTA3LNbZRxgAs7FMDYFW7UAzp
 hNZMjJnJRRBuEQsm/scDVGFl3F1CnxD/UQBFK7HXqfl2FNQM9xzVfhzm6vaSQz1Oui
 eoQoylhJFl+fMdpPBEWkx0gW9z1nkkfG9Ee4wjyAlpTXz2FASBp3lrsVq34UIp87iV
 WiyxUBkfMXtIWN/O5RXzGc5uFFcCQQWtagfWwXYs+Xzz/Ci/ixvZSY69tgrW3wLzm6
 VxO4WOGIITJUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Michal Suchanek
 <msuchanek@suse.de>, David Howells <dhowells@redhat.com>, Aaron Tomlin
 <atomlin@redhat.com>
Subject: Re: [PATCH v5 0/6] KEXEC_SIG with appended signature
In-Reply-To: <YfBd/EDGUx9UIHcb@bombadil.infradead.org>
References: <cover.1641900831.git.msuchanek@suse.de>
 <YfBd/EDGUx9UIHcb@bombadil.infradead.org>
Date: Wed, 09 Feb 2022 15:46:05 +1100
Message-ID: <87pmnwlkaa.fsf@mpe.ellerman.id.au>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luis Chamberlain <mcgrof@kernel.org> writes:
> On Tue, Jan 11, 2022 at 12:37:42PM +0100, Michal Suchanek wrote:
>> Hello,
>> 
>> This is a refresh of the KEXEC_SIG series.
>> 
>> This adds KEXEC_SIG support on powerpc and deduplicates the code dealing
>> with appended signatures in the kernel.
>> 
>> powerpc supports IMA_KEXEC but that's an exception rather than the norm.
>> On the other hand, KEXEC_SIG is portable across platforms.
>> 
>> For distributions to have uniform security features across platforms one
>> option should be used on all platforms.
>> 
>> Thanks
>> 
>> Michal
>> 
>> Previous revision: https://lore.kernel.org/linuxppc-dev/cover.1637862358.git.msuchanek@suse.de/
>> Patched kernel tree: https://github.com/hramrach/kernel/tree/kexec_sig
>> 
>> Michal Suchanek (6):
>>   s390/kexec_file: Don't opencode appended signature check.
>>   powerpc/kexec_file: Add KEXEC_SIG support.
>>   kexec_file: Don't opencode appended signature verification.
>>   module: strip the signature marker in the verification function.
>>   module: Use key_being_used_for for log messages in
>>     verify_appended_signature
>>   module: Move duplicate mod_check_sig users code to mod_parse_sig
>
> What tree should this go through? I'd prefer if over through modules
> tree as it can give a chance for Aaron Tomlin to work with this for his
> code refactoring of kernel/module*.c to kernel/module/

Yeah that's fine by me, the arch changes are pretty minimal and unlikely
to conflict much.

cheers
