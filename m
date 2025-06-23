Return-Path: <linuxppc-dev+bounces-9656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49CAE4892
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 17:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQsSD6vBbz30VZ;
	Tue, 24 Jun 2025 01:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750692540;
	cv=none; b=DH/b80JuSOcCzGFSYxPSkdvJ1UthIDlepyMcLxiuP6b9f5B6vZQfjfC1vpcJiA9X93GTOXY68aOk7F4y2kYXKxBdi6OW2gUU7CcOYNG0MqtVAlZAUhNrH7SpJjQ9LxeG1zLK99doaZQQOfguLZ6/9mHP51McyhU4fWsGrY0lKJDoNIpFVd3xjYvzrB4FnepOBXU0N3nbRi8OxjTZWu+KV9f3rNhzxr6GinL9OaZeb0cjl3WWn2r3mXCwje0DL6i/nLgXipgEmvB3dgYVPFqvU0TodU3hoHq/jdsXTHvYK7S7kW3v3xOdAOpLjnEd7CheIrz5XCDBt1AJ+7rQWVY9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750692540; c=relaxed/relaxed;
	bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6ZeDqsld8sq6SlBBwVnelXKvFRnZ+7F4733IVCbDbsQqvyuT8BK7tjdUJBxNKG9butDCNXvpmfd4Ejbz2/Es5sduE5JuicEbNMO1G/lCiQwkNHyot9tIBQRnMi78qxbBYc6qPiY3tupISajduyNX/ZQTT1r7dyDEYonK3yK2FHHYdUcE/2KnBYePIdrp16b+Vc6EOnYRnejbdIZ8qqEVd4XIOYU/+p9mmPcuYUdHIudaLLfzKL3Xdn9X/4x+F1NEGHStxjEqzvQJ6V9fxn4qQtHt3lmJUnoaJyOGLQIINDBVzhODt/7ucaWo0sbjER+4caCIexrmfL4GLjoE84T4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y989ZLFL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y989ZLFL; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y989ZLFL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y989ZLFL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQsSC36vfz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:28:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750692536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
	b=Y989ZLFL5MKZQVmHDm8RCyWMku7Ncpl7m5kdApgvoqt0HkZQT+rQFFe8u8qqSCIRexteyS
	qfRE53W4PmOpI77jdSM2aCL9EaYjf20fSoA8VP8jgUhR1a+W+mADU4CbBkMU6ehatQuJMc
	ECiXgFD8RGWjFz3ve8Ehflsf3+yQyRg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750692536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
	b=Y989ZLFL5MKZQVmHDm8RCyWMku7Ncpl7m5kdApgvoqt0HkZQT+rQFFe8u8qqSCIRexteyS
	qfRE53W4PmOpI77jdSM2aCL9EaYjf20fSoA8VP8jgUhR1a+W+mADU4CbBkMU6ehatQuJMc
	ECiXgFD8RGWjFz3ve8Ehflsf3+yQyRg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-RGGWDgQYOMaGX4CS8KQtfQ-1; Mon, 23 Jun 2025 11:28:54 -0400
X-MC-Unique: RGGWDgQYOMaGX4CS8KQtfQ-1
X-Mimecast-MFC-AGG-ID: RGGWDgQYOMaGX4CS8KQtfQ_1750692533
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso1583814f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 08:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692533; x=1751297333;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jIKvaSiBVFiBvy2jszdXc9pYCeSx9OZ4mF5dVfnlYek=;
        b=YvWUeHdk58c2xzQR1kcm3E7QIIn6X6pIa+DH4vLU3w4ewL5f/C9qQeQPIhw8PfGci4
         t2K+OZQvwWXx1/Z8awrpykT4CXn5VHpodwacu0wIWSoyuIG+H0G/hMNyHhV7HgpO0swF
         TphXxi7cHAqEBaoPMKYepEQr8b70n5wtcJ+fcTunXkpPSJILz5/f2qSNBsK7flLbUUaK
         r0zNVUQ+eLJVN2MTsKEKMe3WF0GPxcna1z9d1KDEenKy1XAjJ5hejnwVSyAGYJTRYal0
         A2g0lL8iMdXPww9q2GJsdZjmdtTYZr737J7Xc1sVLQ5fSFkTjb4vhONagRK+ormvkIJF
         c0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt1Yjg4koOde06jm8Je09TULkC6nYcbQnUBeKtVnp9Lq3GOKOj8z5uxjCnzCMWpWnZKH6XfEAKkfKL9pM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGQCq+iIpHDIu0ufFznut8G0JmR+v7sQbrllJ+NDfV7tekV8qB
	cX1ccPZZ5Z7o4NgRwa4krY8khD/F4BUanmZ7rBod6+wHlSWd9AKCX8rT5GjJdYf2PO8gF9Nu4Um
	S4nKiRLTsg7Q9w4QAH7xQEWB6hCHTJ1OG7fVuVbJQnVrX+0UC7nCuUHYRp7tALoPCEXE=
X-Gm-Gg: ASbGncufQi69l3u22hRhwE7g1wm2QRluGvFRU4exauk5ZiXTGUqfG0ZyQ0ZTcgnBwJk
	BGTtqjyfP4HKo0TqZUEpNYuj+lq1G0jZDiMycKWivUdsjQaes4DpxIDDTcWv/8NylLx1gi1Jdlx
	fktp+1YQ0QtBmkfbSuCne/TpDfdND1r6i1jGNJEbGS4XfQMHcLwPh1H2iTrXpZlvUmzV/mX05rk
	+IiCWJhFi7k9sAvKz4pJFGUo1AeZuGBDR9/0npW2XkQbO7h+Ws2CD8T7Nw4XzTQLQ6DJOY1lGwC
	R2FqSRXrE4ic+aRdZVNg9Y8+QVe20f69EbR/4lcrD8/ez5gHr01atEe6ruL62fvbx+oWe8fqfyT
	brGsOGkOWg5V1NRi48b79cqNzToBmBryYPseJZecuy8bPI1W8Vw==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6d12db6dbmr12088892f8f.13.1750692532541;
        Mon, 23 Jun 2025 08:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQjA/gAAUo+aZLlUKrA8C3Zh2fK8LfywBbwiGTnqOXqbPvg4WYECzDiK4SRJTthJcREutq7A==
X-Received: by 2002:a5d:5f8c:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a6d12db6dbmr12088866f8f.13.1750692532054;
        Mon, 23 Jun 2025 08:28:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1193792sm9837820f8f.97.2025.06.23.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:28:51 -0700 (PDT)
Message-ID: <b0e47950-9fcb-4fb8-8bf4-c4a3c69387af@redhat.com>
Date: Mon, 23 Jun 2025 17:28:49 +0200
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
Subject: Re: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-6-david@redhat.com>
 <D114CF56-016B-4140-97A0-42163727EB6C@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <D114CF56-016B-4140-97A0-42163727EB6C@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Dgo8m9ydmFnrw7JpjllV3MiYDepIYaNkvSkE3tSl2Q_1750692533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18.06.25 20:50, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> 
>> Let the buddy handle clearing the type.
> 
> The below might be more precise? Since page type is cleared
> before the page reaches buddy code.
> 
> Let the free page routine handle clearing the type.

"Let the page freeing code handle clearing the page type."

?

Thanks!

-- 
Cheers,

David / dhildenb


