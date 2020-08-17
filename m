Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB28245EC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 10:04:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVRQq1H3CzDqML
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVR9G5g6JzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:52:50 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0E90E68AFE; Mon, 17 Aug 2020 09:52:46 +0200 (CEST)
Date: Mon, 17 Aug 2020 09:52:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 05/11] test_bitmap: skip user bitmap tests for
 !CONFIG_SET_FS
Message-ID: <20200817075245.GA15391@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-6-hch@lst.de>
 <9e632937-9e9a-faed-bc0e-fcb7a6b4f54c@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e632937-9e9a-faed-bc0e-fcb7a6b4f54c@csgroup.eu>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 09:50:05AM +0200, Christophe Leroy wrote:
>
>
> Le 17/08/2020 à 09:32, Christoph Hellwig a écrit :
>> We can't run the tests for userspace bitmap parsing if set_fs() doesn't
>> exist.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   lib/test_bitmap.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
>> index df903c53952bb9..49b1d25fbaf546 100644
>> --- a/lib/test_bitmap.c
>> +++ b/lib/test_bitmap.c
>> @@ -365,6 +365,7 @@ static void __init __test_bitmap_parselist(int is_user)
>>   	for (i = 0; i < ARRAY_SIZE(parselist_tests); i++) {
>>   #define ptest parselist_tests[i]
>>   +#ifdef CONFIG_SET_FS
>
> get_fs() and set_fs() have stubs for when an arch doesn't define them, so I 
> this it would be cleaner if you were using 'if (IS_ENABLED(CONFIG_SET_FS) 
> && is_user)`instead of an ifdefery in the middle of the if/else.

No, I don't provide stubs in the prep patch, and that has been intentional
as I don't want this to spread much.  test_bitmap would be the only place
where they are somewht useful, and I just hope this test is eventually
getting rewritten to run in a normal user space context where the
uaccess tests can be resurrected.
