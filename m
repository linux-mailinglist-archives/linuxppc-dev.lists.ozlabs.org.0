Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A9738F24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:50:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXcY1tPCz2xFm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:50:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=talpey.com (client-ip=2a01:111:f400:fe59::628; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=tom@talpey.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmVrP08RPz30Kk;
	Thu, 22 Jun 2023 03:30:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nprCUexRgZAKJR5brPgGuVe+pm7FEZyfJ3h5IKWtkZKUvIC824nKNeabl16R4ubCpUTSN5Uzrp1jI0gWo+py2oiNDsqVLvVV3GAPenKSn6feEO0iAbTAwlugqlb4Swr+Sa+0ktE7Dt7FzWR/SGHXRLqTdgtZD7RjaaZSx8ru29PU+RaMbXBKovJsR1xNXD9L3VA00BZ4W+CA7+c97Kah9xBuudMbF7lSEzD1IJGycfkUyqTgyLzw36E6/4Us+CxNaLA19GOGvapKaP/NUEJ2sViT9DsoSyn6sZRK8B03gPvtR2bv4zTlxec0+T/l1+l2zLWwB3apIvUw2wgabsnTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TT7Kwu7fG6BWdEBVvDk+5WZrF7YR7qqWojgU6yBBfPw=;
 b=giXF3SIeJLFsT7izqNqNdNwkQ9M8KK+sIIBqR3k/BieWTNjrBaPs6WqWu1rnQgs3VFTZ+d8gVxteBk1WrDPhZkdtq7tGqoOKpcFCBwyG09yXVhhn5G9+DlbN1eujwKon8/18g3KFJDmh9/MQMb9HRqrRW8ZFlPwz/TdTgX9v0MIpyHR0a2H9i/wjksUdvKrJ+5dFhp+e83w6zVmRbEPkGJ0UrTQ9F3O5VSnfUVSwTa2mtBvWPBsctSmcvMoPoenm0hYWJMQZF7aON/s9WHmDBVlHU3DTtLD5Pv1A3s2Rhn1vNKuJbhZB3326yp8k7w4JkxEmPExKtaehNq5roZC4Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 PH0PR01MB7976.prod.exchangelabs.com (2603:10b6:510:28b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Wed, 21 Jun 2023 17:29:48 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::17e9:7e30:6603:23bc]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::17e9:7e30:6603:23bc%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 17:29:48 +0000
Message-ID: <1f97d595-e035-46ce-6269-eebfe922cf35@talpey.com>
Date: Wed, 21 Jun 2023 13:29:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/79] fs: add ctime accessors infrastructure
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Ian Kent <raven@themaw.net>,
 Luis de Bethencourt <luisbg@kernel.org>, Salah Triki
 <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
 Nicolas Pitre <nico@fluxnic.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tyler Hicks <code@tyhicks.com>, Ard Biesheuvel <ardb@kernel.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Miklos Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <chuck.lever@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>,
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Evgeniy Dushistov <dushistov@mail.ru>,
 Hans de Goede <hdegoede@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, Juergen Gross <jgross@suse.com>,
 Ruihan Li <lrh2000@pku.edu.cn>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Udipto Goswami <quic_ugoswami@quicinc.com>,
 Linyu Yuan <quic_linyyuan@quicinc.com>, John Keeping <john@keeping.me.uk>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Dan Carpenter <error27@gmail.com>, Yuta Hayama <hayama@lineo.co.jp>,
 Jozef Martiniak <jomajm@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Alan Stern <stern@rowland.harvard.edu>, Sandeep Dhavale
 <dhavale@google.com>, Dave Chinner <dchinner@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, ZhangPeng <zhangpeng362@huawei.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Aditya Garg <gargaditya08@live.com>, Erez Zadok <ezk@cs.stonybrook.edu>,
 Yifei Liu <yifeliu@cs.stonybrook.edu>, Yu Zhe <yuzhe@nfschina.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Oleg Kanatov <okanatov@gmail.com>, "Dr. David Alan Gilbert"
 <linux@treblig.org>, Jiangshan Yi <yijiangshan@kylinos.cn>,
 xu xin <cgel.zte@gmail.com>, Stefan Roesch <shr@devkernel.io>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Seth Forshee <sforshee@digitalocean.com>,
 Zeng Jingxiang <linuszeng@tencent.com>, Bart Van Assche
 <bvanassche@acm.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, Zhang Yi <yi.zhang@huawei.com>,
 Tom Rix <trix@redhat.com>, "Fabio M. De Francesco"
 <fmdefrancesco@gmail.com>, Chen Zhongjin <chenzhongjin@huawei.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>, Rik van Riel <riel@surriel.com>,
 Jingyu Wang <jingyuwang_vip@163.com>, Hangyu Hua <hbh25y@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
From: Tom Talpey <tom@talpey.com>
In-Reply-To: <20230621144507.55591-2-jlayton@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0044.namprd19.prod.outlook.com
 (2603:10b6:208:19b::21) To SN6PR01MB4445.prod.exchangelabs.com
 (2603:10b6:805:e2::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|PH0PR01MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: a87590c4-dfbb-4123-7a0c-08db727d1c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ebIVZ2lP88IpgoaPlyv0/XApxVauaI/c6ecMOapeeDWNf9jes1zrAVrrmH2jn/JCw5MqzpD/iiY5VgaZrkjuHTGrcF4TwFBKEpLM0Y4btotHRdVGi5pdk8Mm65mTC3AOmE3f73yf2gdAn+PB+PDqPiGQ7SJsAwECE4sM2H612pvDCCCOgs8S6jM+wb4cCtK0iMEwuNn+/CrmmEevKieK071/PIWklP/k6rFnr6VKm5mkazDb8VrIJQyTzklsx/SpZhSly8HRoMMp3/g3bLEEnASYe3MlbF9FXFmylpDhpF2qmbdAqnYmRD+3jLPYEe2XS5GHcrzC3mLZsXlYDzv/OpIYaoui/WhroKMWh7z6/UkgU2aaW0AJ9bgv/PaH6YTJpJbbVaGoSZ5VAYH4rQc7T527Oz7hOU4A7Nr2DLviXvflyhXW96J6TvMfPpAY4bNeqq/beT7QA7zmsw2wCx+GldUmbT+j5jc6dvS2KC60nHW90uH6bTgeC1VPaB3jlzbt2ir0jPIe4/XOAsrqaL32oYPe5R9X12M0vFe2zUpxzWk80wNn+3PayRyChImmrAytLST4djrm4is2DKzr05KWIjJKqXaLdMfQ/8cbXOqiDr/P5e9Ya2mh2LQhyEwcIscrH2BHSFDXqsW1bwEQ/dF1mIDCVTpceTld2KfVWgrmOWc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4445.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39830400003)(136003)(346002)(396003)(376002)(451199021)(6486002)(52116002)(6666004)(478600001)(76576003)(36756003)(83380400001)(1191002)(38100700002)(38350700002)(2616005)(31696002)(86362001)(186003)(921005)(53546011)(6506007)(6512007)(26005)(8936002)(8676002)(41300700001)(7276002)(7406005)(7366002)(7416002)(31686004)(7336002)(5660300002)(2906002)(110136005)(316002)(66946007)(66476007)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bjNab0pKSmUrc3NzZitDZk4zNElnTzV1aVEzMnEwdnVYWndYU3ovdEZxSEdS?=
 =?utf-8?B?TFZKdlFjbUJvVGlUbzVZTDNBbHdaZGd3Rm50b2piUFQ5a21DUDZJZ0VFNVdm?=
 =?utf-8?B?VlMxV2ZvVVBjcmZzaDhHcW5vT29kMFExR3hycW5JT25VSDU1NmpTYmYwZ2lQ?=
 =?utf-8?B?R0tzRi9HRnVVdFFsZ01jcHV2dWNwSTFlcWhqYmJ5V09oSERHbmhTN2VGN01m?=
 =?utf-8?B?TFRIQkJKM2xXNlBnVTNnRlF5c2x0NHNSdFBNQVV4QXhSWHR2eDlEeFVzTUV5?=
 =?utf-8?B?RVZYYkNLWk11YWRKcGhQQVZnVWdOdFo4NnBEa1k4ak9Iek91ZjQrSW14SWdP?=
 =?utf-8?B?bngwSW40YW00SW40NmkxTlhHb1oremxKWGhWZCtxaTlSbDNwYjlJTXpyN1Iw?=
 =?utf-8?B?WXlibjVlQ244c1kxQk9rOGlXNFZGaHdlNVI1elVqS3NnN0lqTFJheTZHK1l1?=
 =?utf-8?B?L0wyTnpUVm5wY1ozQjhUenR2czlQUzZMbEx6WWdRcTdmWUQ3aGRZcDlVL0V2?=
 =?utf-8?B?RDIwc1c2T2sxakVBazA2NFlxWktMN1lyMFpScFZ3NTdqdytDekJxQU5qenVm?=
 =?utf-8?B?a0Y2OWZjK3Q4YmFzUzIrYkVwNlRLb3hYelJsSVJFRkxHcjRYT0s4NldFSXpI?=
 =?utf-8?B?RVZtQmp1RFJyNnh5QWhySHF2N2F6bi9DMFZpQzJQUXN5dFdIUGtmY0tqbkx0?=
 =?utf-8?B?cmdENjZnaEdaa1ZWY2NMSENOc2xXR1g4ZU9UWTUwVFVFYXNibTE2S3hDM3Jy?=
 =?utf-8?B?aHczM0JhYXJKempjemVuZWxnT1VFOWJSeTZMS21NcHF4RGdCQXd2dHJXWElM?=
 =?utf-8?B?cXhyS1dmSlZGUFhYTGk3c3hUY0pHMlZ3RjMrWnRrTDVNY2ZTVGNUbGVzRXU2?=
 =?utf-8?B?YkJnMG40cDhJajExYTM0WnVHc1pmSmJJZ2cvNlp2TjhUS3gvb1BFMlhHbk45?=
 =?utf-8?B?YlJ6MERxTmlhcnMraXlPbnlVZVNNTG1qcTBFclRYdXBpVndoeGhQdW5Vb05Q?=
 =?utf-8?B?MHlUaVVwSHgzeE9CbkdwZk9wOEN4Q1hsNzVwVFhOK0JGNTdqZWxhVVdacjlr?=
 =?utf-8?B?WEZZVjVxTG5yenFjSFRkOTg1OGM4YkxRNkJRaW5TUHhDZ2tBWmFKVlZZQWxS?=
 =?utf-8?B?WlJ2Slg4UGZvYlpmNUdudlhXU0JJdEJQTG9XVHgvMmRPQ2lLb2d3ay9UcnR4?=
 =?utf-8?B?eFJycC9TWFNOQ3RIRUk1UnNsaUU4Qk5JM29NQ3QxVElqUElXQXFVbFZBUEhQ?=
 =?utf-8?B?L2JnTWxtK0pUbHFqTElzVHdUOWFxYmoxZjd5Vjk1OVJpcmc3dmhSc0dQNEEw?=
 =?utf-8?B?bjZGSDhkZE1IVHhQVjZuSDVhRUhkazVjcTFYQmpHVjM1YjRKTHF3MzE3aytS?=
 =?utf-8?B?VUlVOEEwL245VVpXZjR1VDl5aVRmVFk4Wlc2eDkyYjY4NmZKRVBMNkk3TFBU?=
 =?utf-8?B?MlpzQmVnSnZLNTZvVVQ5dDBxZGdOYXUxaGJRdXRRS0N3UDhmR2ZzR0RFWUpG?=
 =?utf-8?B?a29lc0pLLzRVRVV4YUhIVmZkYmZrSGg4WVBrZElNY0xvVWhLZWo1WmpSa3VT?=
 =?utf-8?B?dTQ4QlZVVUlSaUxWZjJ3akUxVkkvUVJFb1RnOXBKRzIyYjR6azlXUWlZMVFk?=
 =?utf-8?B?UVRkWEtrOXNhSzcvb08zOHF2Vlo3SXhnOEQxNHlac0JQamFySEw1ZXlyZTR3?=
 =?utf-8?B?MTRqSytyMWJ0U0Z4V1d5cHF1OUZicGJZTWJIVkhVMFN1N2lPdi8yMUcxUjNj?=
 =?utf-8?B?QzJNc01nWlhXU21PYkVLSjVySDJSaHNBSnBuaGlmUnVPcnJUVnI2Q2s5c2JV?=
 =?utf-8?B?U3VzVjdIMTdWUUozUHA1VkxBYkI5dnlTdVVNMzV2TEpLMkdvWk4vQ3BoN0Ux?=
 =?utf-8?B?WDdrV21WcFNGYXRsVlcwZU5xYVBTSVJzYnkyOUY1YXN0bURBeXhSdlNOZVJR?=
 =?utf-8?B?c1RzME9oNmE1ZEFUdnl5MW5Td2hTTTJtQnVqMFdMVlFleUFaclZXR3kvNFhM?=
 =?utf-8?B?MDZGNzZJK1VoZVVIOU00QXgvUk90dDZVUVFsUFFzTitCdFBIRXVmNDJVTk9z?=
 =?utf-8?B?NERpcVBZemN5aWEwajl1VFJZY0UzYTF2VnJPUFpjM3p2QTZlaGlhdHhWY0ZB?=
 =?utf-8?Q?QZlEOIj5TLolgnPxRlWOC7Bv1?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87590c4-dfbb-4123-7a0c-08db727d1c63
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 17:29:47.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyC3gYC+Zqgx5aW3PCa1QPdWhwgB2jdF8rd0UI9nwHU/wkGKULuzvZBbtW9jiPuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7976
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/21/2023 10:45 AM, Jeff Layton wrote:
> struct timespec64 has unused bits in the tv_nsec field that can be used
> for other purposes. In future patches, we're going to change how the
> inode->i_ctime is accessed in certain inodes in order to make use of
> them. In order to do that safely though, we'll need to eradicate raw
> accesses of the inode->i_ctime field from the kernel.
> 
> Add new accessor functions for the ctime that we can use to replace them.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>   fs/inode.c         | 16 ++++++++++++++
>   include/linux/fs.h | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index d37fad91c8da..c005e7328fbb 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2499,6 +2499,22 @@ struct timespec64 current_time(struct inode *inode)
>   }
>   EXPORT_SYMBOL(current_time);
>   
> +/**
> + * inode_ctime_set_current - set the ctime to current_time
> + * @inode: inode
> + *
> + * Set the inode->i_ctime to the current value for the inode. Returns
> + * the current value that was assigned to i_ctime.
> + */
> +struct timespec64 inode_ctime_set_current(struct inode *inode)
> +{
> +	struct timespec64 now = current_time(inode);
> +
> +	inode_set_ctime(inode, now);
> +	return now;
> +}
> +EXPORT_SYMBOL(inode_ctime_set_current);
> +
>   /**
>    * in_group_or_capable - check whether caller is CAP_FSETID privileged
>    * @idmap:	idmap of the mount @inode was found from
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6867512907d6..9afb30606373 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1474,7 +1474,58 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
>   	       kgid_has_mapping(fs_userns, kgid);
>   }
>   
> -extern struct timespec64 current_time(struct inode *inode);
> +struct timespec64 current_time(struct inode *inode);
> +struct timespec64 inode_ctime_set_current(struct inode *inode);
> +
> +/**
> + * inode_ctime_peek - fetch the current ctime from the inode
> + * @inode: inode from which to fetch ctime
> + *
> + * Grab the current ctime from the inode and return it.
> + */
> +static inline struct timespec64 inode_ctime_peek(const struct inode *inode)
> +{
> +	return inode->i_ctime;
> +}
> +
> +/**
> + * inode_ctime_set - set the ctime in the inode to the given value
> + * @inode: inode in which to set the ctime
> + * @ts: timespec value to set the ctime
> + *
> + * Set the ctime in @inode to @ts.
> + */
> +static inline struct timespec64 inode_ctime_set(struct inode *inode, struct timespec64 ts)
> +{
> +	inode->i_ctime = ts;
> +	return ts;
> +}
> +
> +/**
> + * inode_ctime_set_sec - set only the tv_sec field in the inode ctime

I'm curious about why you choose to split the tv_sec and tv_nsec
set_ functions. Do any callers not set them both? Wouldn't a
single call enable a more atomic behavior someday?

   inode_ctime_set_sec_nsec(struct inode *, time64_t, time64_t)

(or simply initialize a timespec64 and use inode_ctime_spec() )

Tom.

> + * @inode: inode in which to set the ctime
> + * @sec:  value to set the tv_sec field
> + *
> + * Set the sec field in the ctime. Returns @sec.
> + */
> +static inline time64_t inode_ctime_set_sec(struct inode *inode, time64_t sec)
> +{
> +	inode->i_ctime.tv_sec = sec;
> +	return sec;
> +}
> +
> +/**
> + * inode_ctime_set_nsec - set only the tv_nsec field in the inode ctime
> + * @inode: inode in which to set the ctime
> + * @nsec:  value to set the tv_nsec field
> + *
> + * Set the nsec field in the ctime. Returns @nsec.
> + */
> +static inline long inode_ctime_set_nsec(struct inode *inode, long nsec)
> +{
> +	inode->i_ctime.tv_nsec = nsec;
> +	return nsec;
> +}
>   
>   /*
>    * Snapshotting support.
